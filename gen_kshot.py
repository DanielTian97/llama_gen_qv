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

def parse_qv_info(line: str):
    qid = line[1:-1].split(', ')[0]
    rbo_part = line[1:-1].split(': ')[-1]
    rbo = float(rbo_part[1:-1])
    qv = line[1+len(qid)+2:-1-len(rbo_part)-2]
    
    return qid, qv, rbo

def load_examples(retriever, qv_method):
    cwd = os.getcwd()
    filename = os.path.join(cwd, 'qv_examples', f'{retriever}.{qv_method}.qv')
    f = open(filename, 'r')
    
    qv_book = {}

    for line in f:
        if(line[:4] == '*Q=$'):
            qid, target_query, _ = parse_qv_info(line=line[3:])
            qv_book.update({qid: []})
            rank = 0
            # print('Q', qid, target_query)
        elif(line[0] == '$'):
            rqid, qv, rbo = parse_qv_info(line=line)
            qv_book[qid].append({'rank': rank, 'qv': qv, 'rbo': rbo})
            rank += 1
            # print(rqid, qv, rbo)
    
    f.close()
    return qv_book

def compose_context(qid, top_qv_num, qv_book):
    qvs = [x['qv'] for x in qv_book[str(qid)][:top_qv_num]]
    context = ''
    
    for i in range(len(qvs)):
        qv = qvs[i]
        context += f'Example {i}: {qv}\n'
    
    return context

if __name__=="__main__":
    dataset_name = int(sys.argv[1])
    k = int(sys.argv[2]) # number of examples

    qv_book = load_examples('mt5', 'sbert')
    
    preamble = "You are an experienced searcher. Please reformulate the following query in 10 different ways so that the reformulated query has a similar (either more specific or more generic) information need. Examples of reformulated queries are provided."
    llm = load_llama()

    queries, res = prepare_data(dataset_name)

    cwd = os.getcwd()
    raw_results_path = os.path.join(cwd, 'products', f'qvs_for_{dataset_name}_{k}shot_test.json')
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

        examples = compose_context(qid, k, qv_book)
        prompt = f'{preamble}\n{examples}Query:"{query}"'
        print(prompt)

        output = llama_call(llm, prompt, 0.3)
        answer = output['choices'][0]['text']
        
        # print(answer)
        results.update({qid: {'query': query, 'variants': answer}})
        update_json_result_file(raw_results_path, results)