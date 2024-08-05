import json
import os
import sys

def load_raw_data(dataset_name):
    cwd = os.getcwd()
    raw_results_path = os.path.join(cwd, 'products', f'qvs_for_{dataset_name}_0shot.json')
    try:
        f = open(file=raw_results_path, mode="r")
        results = json.load(f)
        f.close()
    except:
        print(f'{raw_results_path} does not exist yet.')
    return results

def split_filter_lines(raw_answer):
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
        if((split[0] >= '0') & (split[0] <= '9')):
            # print(split)
            candidates.append(split)
        elif((split[:2] == 'Re') & (split[14] >= '0') & (split[14] <= '9')): # special case 'Reformulation 1: '
            candidates.append(split)

    # if(len(candidates) != 10):
    #     print(len(candidates))
    #     print(splits)

    return candidates

def parse_qv(raw_string_containing_qv):
    #split
    split_by = '. '
    parts = raw_string_containing_qv.split(split_by)
    if(len(parts) != 2):
        split_by = ': '
        parts = raw_string_containing_qv.split(split_by)
    if(len(parts) != 2):
        split_by = '. '
        parts = raw_string_containing_qv.split(split_by)
    if(len(parts) != 2):
        split_by = '."'
        parts = raw_string_containing_qv.split(split_by)
    if(len(parts) == 1):
        print(raw_string_containing_qv)
        print(parts)
    #parse
    behead = ''
    if(split_by == '."'):
        behead = '"'
    for part in parts[1:]:
        behead += part + split_by
    behead = behead[:-len(split_by)]
    qv = behead
    qv = qv.split('(more specific)')[0]
    qv = qv.split('(more generic)')[0]
    if(len(qv) == 0):
        print(qv)
    if(qv[0] == '"'):
        qv = qv[1:-1]
    return qv

def save_result(dataset_name, results_to_write):
    cwd = os.getcwd()
    processed_results_path = os.path.join(cwd, 'qvs', f'qvs_for_{dataset_name}_0shot_processed.json')
    f = open(file=processed_results_path, mode="w+", encoding='UTF-8')
    json.dump(results_to_write, f, indent=4)
    f.close()

if __name__=="__main__":
    dataset_name = int(sys.argv[1])
    #load raw data
    results = load_raw_data(dataset_name)
    #processing
    processed_results = {}
    for qid in results:
        query = results[qid]['query']
        print(qid, query)
        whole_answer = results[qid]['variants']
        candidates = split_filter_lines(whole_answer)
        
        qvs = []
        for candidate in candidates:
            qv = parse_qv(candidate)
            qvs.append(qv)
        
        processed_results.update({qid: {'query': query, 'variants': qvs}})
        save_result(dataset_name, processed_results)
