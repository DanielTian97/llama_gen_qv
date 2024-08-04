from llama_cpp import Llama
import json
import sys

def load_llama():
      llm = Llama(
            model_path="../Meta-Llama-3-8B-Instruct/Meta-Llama-3-8B-Instruct.Q8_0.gguf",
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
    # prepare queries
    queries = pd.read_csv(f'./materials/queries_{dataset_name}.csv')
    # prepare res file
    res = pd.read_csv(f'./res/bm25_dl_{dataset_name}.csv') # retrieval result
      
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

    raw_results_path = f'./products/qvs_for_{dataset_name}_0shot.json'

    results = {}
    for qid, query in zip(queries['qid'], queries['query']):
        print(qid)

        prompt = f'{preamble}\nQuery:"{query}"'

        output = llama_call(llm, prompt, 0.3)
        answer = output['choices'][0]['text']
        
        # print(answer)
        results.update({qid: {'query': query, 'variants': answer}})
        update_json_result_file(raw_results_path, results)