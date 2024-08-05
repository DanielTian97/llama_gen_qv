#!/bin/sh
python gen_0shot.py 19
echo 'Finished generation for trec-dl-19!'
python gen_0shot.py 20
echo 'Finished generation for trec-dl-20!'
python gen_0shot.py 21
echo 'Finished generation for trec-dl-21!'
python gen_0shot.py 22
echo 'Finished generation for trec-dl-22!'
python process_raw_result.py 19
echo 'Finished parsing for trec-dl-19!'
python process_raw_result.py 20
echo 'Finished parsing for trec-dl-20!'
python process_raw_result.py 21
echo 'Finished parsing for trec-dl-21!'
python process_raw_result.py 22
echo 'Finished parsing for trec-dl-22!'