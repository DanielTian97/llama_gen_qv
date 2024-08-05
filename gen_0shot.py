from llama_cpp import Llama
import json
import sys
import os

def load_llama():
    cwd = os.getcwd()
    parent = os.path.dirname(cwd)
    llm = Llama(
        model_path=os.path.join(parent, 'Meta-Llama-3-8B-Instruct', 'Meta-Llama-3-8B-Instruct.Q8_0.gguf'),
        logits_all=True,
        verbose=False,
        n_gpu_layers=-1, # Uncomment to use GPU acceleration
        n_ctx=2048, # Uncomment to increase the context window
    )
    llm.set_seed(1000)
    return llm

def llama_call(llm, prompt, temperature):
      
      output = llm(
                  prompt, # Prompt
                  max_tokens=300, # Generate up to 300 tokens, set to None to generate up to the end of the context window
                #   stop=["STOP"], # Stop generating just before the model would generate a new question
                  echo=False, # Echo the prompt back in the output
                #   logprobs=50,
                #   top_k=50,
                  temperature=temperature,
            ) # Generate a completion, can also call create_completion
      
      return output
  
# prepare needed files
def prepare_data(dataset_name):
    import pandas as pd
    
    cwd = os.getcwd()
    query_path = os.path.join(cwd, 'materials', f'queries_{dataset_name}.csv')
    res_path = os.path.join(cwd, 'res', f'bm25_dl_{dataset_name}.csv')
    # prepare queries
    queries = pd.read_csv(query_path)
    # prepare res file
    res = pd.read_csv(res_path)
      
    return queries, res

def update_json_result_file(file_name, result_to_write):
    f = open(file_name, "w+", encoding='UTF-8')
    json.dump(result_to_write, f, indent=4)
    f.close()

if __name__=="__main__":
    dataset_name = int(sys.argv[1])
    preamble = "You are an experienced searcher. Please reformulate the following query in 10 different ways so that the reformulated query has a similar (either more specific or more generic) information need."
    llm = load_llama()

    queries, res = prepare_data(dataset_name)

    cwd = os.getcwd()
    raw_results_path = os.path.join(cwd, 'products', f'qvs_for_{dataset_name}_0shot.json')
    try:
        f = open(file=raw_results_path, mode="r")
        results = json.load(f)
        existed_qids = len(results)
        f.close()
    except:
        f = open(file=raw_results_path, mode="w+")
        results = {}
        existed_qids = 0
        f.close()

    for qid, query in zip(queries['qid'].tolist()[existed_qids:], queries['query'].tolist()[existed_qids:]):
        print(qid)

        prompt = f'{preamble}\nQuery:"{query}"'

        output = llama_call(llm, prompt, 0.3)
        answer = output['choices'][0]['text']
        
        # print(answer)
        results.update({qid: {'query': query, 'variants': answer}})
        update_json_result_file(raw_results_path, results)