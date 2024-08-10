#!/bin/sh
python gen_kshot.py 19 9 sbertr
echo 'Finished generation for trec-dl-19 (k=9, sbertr)!'
python gen_kshot.py 20 9 sbertr
echo 'Finished generation for trec-dl-20 (k=9, sbertr)!'
python gen_kshot.py 19 10 sbertr
echo 'Finished generation for trec-dl-19 (k=10, sbertr)!'
python gen_kshot.py 20 10 sbertr
echo 'Finished generation for trec-dl-20! (k=10, sbertr)'
python process_raw_result.py 19 9 sbertr
echo 'Finished parsing for trec-dl-19! (k=9, sbertr)'
python process_raw_result.py 20 9 sbertr
echo 'Finished parsing for trec-dl-20! (k=9, sbertr)'
python process_raw_result.py 19 10 sbertr
echo 'Finished parsing for trec-dl-19! (k=10, sbertr)'
python process_raw_result.py 20 10 sbertr
echo 'Finished parsing for trec-dl-20! (k=10, sbert)'
python gen_kshot.py 19 9 bm25r
echo 'Finished generation for trec-dl-19 (k=9, bm25r)!'
python gen_kshot.py 20 9 bm25r
echo 'Finished generation for trec-dl-20 (k=9, bm25r)!'
python gen_kshot.py 19 10 bm25r
echo 'Finished generation for trec-dl-19 (k=10, bm25r)!'
python gen_kshot.py 20 10 bm25r
echo 'Finished generation for trec-dl-20! (k=10, bm25r)'
python process_raw_result.py 19 9 bm25r
echo 'Finished parsing for trec-dl-19! (k=9, bm25r)'
python process_raw_result.py 20 9 bm25r
echo 'Finished parsing for trec-dl-20! (k=9, bm25r)'
python process_raw_result.py 19 10 bm25r
echo 'Finished parsing for trec-dl-19! (k=10, bm25r)'
python process_raw_result.py 20 10 bm25r
echo 'Finished parsing for trec-dl-20! (k=10, bm25r)'