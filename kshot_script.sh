#!/bin/sh
python gen_kshot.py 19 1
echo 'Finished generation for trec-dl-19 (k=1)!'
python gen_kshot.py 20 1
echo 'Finished generation for trec-dl-20! (k=1)'
python gen_kshot.py 19 2
echo 'Finished generation for trec-dl-19 (k=2)!'
python gen_kshot.py 20 2
echo 'Finished generation for trec-dl-20! (k=2)'
python gen_kshot.py 19 3
echo 'Finished generation for trec-dl-19 (k=3)!'
python gen_kshot.py 20 3
echo 'Finished generation for trec-dl-20! (k=3)'
python process_raw_result.py 19 1
echo 'Finished parsing for trec-dl-19! (k=1)'
python process_raw_result.py 20 1
echo 'Finished parsing for trec-dl-20! (k=1)'
python process_raw_result.py 19 2
echo 'Finished parsing for trec-dl-19! (k=2)'
python process_raw_result.py 20 2
echo 'Finished parsing for trec-dl-20! (k=2)'
python process_raw_result.py 19 3
echo 'Finished parsing for trec-dl-19! (k=3)'
python process_raw_result.py 20 3
echo 'Finished parsing for trec-dl-20! (k=3)'