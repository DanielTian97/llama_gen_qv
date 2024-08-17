import json
import os
import sys

def load_raw_data(dataset_name, k, qv_method):
    cwd = os.getcwd()
    raw_results_path = os.path.join(cwd, 'products', f'qvs_for_{dataset_name}_{k}shot_{qv_method}.json')
    try:
        f = open(file=raw_results_path, mode="r")
        results = json.load(f)
        f.close()
    except:
        print(f'{raw_results_path} does not exist yet.')
    return results

def split_filter_lines(raw_answer):
    
    raw_answer = raw_answer.strip()
    if((raw_answer[0]=='(') & ((raw_answer[2]==')')|(raw_answer[3]==')'))): #temporary special case for ' (1)'
        temp_splits = raw_answer.split('\n')
        if(len(temp_splits[0])>100):
            temp_result_str = ''
            temp_str = raw_answer.split('\n')[0]
            temp_list = temp_str.split('(')
            for temp_e in temp_list[1:]:
                temp_result_str += ('(' + temp_e + '\n')
            # print(temp_result_str[:-1])
            temp_splits[0] = temp_result_str[:-1]
            
            raw_answer = ''
            for temp_part in temp_splits:
                raw_answer += (temp_part + '\n')
            raw_answer = raw_answer[:-1]
    
    splits = raw_answer.split('\n')
    
    temp = []
    #filter the empty lines
    for split in splits:
        if(len(split) > 3):
            temp.append(split)
    splits = temp
    del temp

    candidates = []
    for split in splits:
        if(len(candidates)>=10):
            break
        
        split = split.strip()
        if((split[0]=='(') & ((split[2]==')')|(split[3]==')'))): #temporary special case for ' (1)'
            split = split[1:]
            # print(split)
        
        if((split[0] >= '0') & (split[0] <= '9')):
            # print(split)
            
            if('->' in split):
                before_the_repeat = ''
                for c in split:
                    if(c != '"'):
                        before_the_repeat += c
                    else:
                        break
                modified_split = before_the_repeat + split.split(' -> ')[-1]
                # print(modified_split)
                candidates.append(modified_split)
            else:  
                candidates.append(split)
        elif(split[:2] == 'Re'):
            if(len(split) > 14):
                if((split[14] >= '0') & (split[14] <= '9')): # special case 'Reformulation 1: '
                    candidates.append(split)
            if(len(split) > 20):
                if((split[19] >= '0') & (split[19] <= '9')): # special case 'Reformulation Query 1: '
                    candidates.append(split)
        elif(len(split) >= 10):
            if(split[:8] == 'Example '):
                if((split[8] >= '0') & (split[8] <= '9')): # special case 'Example 1: '
                    candidates.append(split)
                    # print(split)

    # if(len(candidates) != 10):
    #     print(len(candidates))
    #     print(splits)

    return candidates

def parse_qv(raw_string_containing_qv):
    # behead
    find_num = False
    i = 1 #because there are usually a separator between the number and the sentence
    for c in raw_string_containing_qv:
        if((c >= '0') & (c <= '9')):
            i += 1
            find_num = True
        else:
            if(find_num):
                break
            else:
                i += 1
    behead = raw_string_containing_qv[i:].strip()
    #parse
    qv = behead
    qv = qv.split('(more specific)')[0]
    qv = qv.split('(more generic)')[0]
    if(len(qv) == 0):
        print(qv)
    elif(qv[0] == '"'):
        qv = qv[1:-1]
    
    if('reformulate to: ' in qv):
        qv = qv.split('reformulate to: ')[1]
    
    if('?' in qv):
        qv = qv.strip()
        if(qv[-1] != '?'):
            question_mark = qv.index('?')+1
            qv = qv[:question_mark]
    
    if('- This query is ' in qv):
        qv = qv.split('- This query is ')[0]
        qv = qv.strip()
        # print(qv)
    
    return qv

def save_result(dataset_name, results_to_write, qv_method):
    cwd = os.getcwd()
    processed_results_path = os.path.join(cwd, 'qvs', f'qvs_for_{dataset_name}_{k}shot_{qv_method}_processed.json')
    f = open(file=processed_results_path, mode="w+", encoding='UTF-8')
    json.dump(results_to_write, f, indent=4)
    f.close()

if __name__=="__main__":
    dataset_name = int(sys.argv[1])
    k = int(sys.argv[2])
    qv_method = sys.argv[3]
    #load raw data
    results = load_raw_data(dataset_name, k, qv_method)
    #processing
    processed_results = {}
    for qid in results:
        query = results[qid]['query']
        # print(qid, query)
        whole_answer = results[qid]['variants']
        candidates = split_filter_lines(whole_answer)
        
        qvs = []
        for candidate in candidates:
            qv = parse_qv(candidate)
            qvs.append(qv)
        
        processed_results.update({qid: {'query': query, 'variants': qvs}})
        save_result(dataset_name, processed_results, qv_method)
