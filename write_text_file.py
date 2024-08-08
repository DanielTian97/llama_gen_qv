import json
import os
import copy

cwd = os.getcwd()
raw_results_path_19 = os.path.join(cwd, 'qvs', f'qvs_for_{19}_0shot_processed.json')
raw_results_path_20 = os.path.join(cwd, 'qvs', f'qvs_for_{20}_0shot_processed.json')

f = open(file=raw_results_path_19, mode="r")
results_19 = json.load(f)
f.close()

f = open(file=raw_results_path_20, mode="r")
results_20 = json.load(f)
f.close()

results_to_write = copy.deepcopy(results_19)
results_to_write.update(results_20)

print(len(results_to_write))

f = open("./qv_files_for_experiment/trecdl_qv_llama3.tsv", "w+")

for qid in results_to_write:
    content = results_to_write[qid]
    query = content['query']
    to_write = f'{qid}\t{query}'
    for variant in content['variants']:
        to_write += f'\t{variant}'
    to_write += '\n'
    print(to_write)
    f.write(to_write)

f.close()