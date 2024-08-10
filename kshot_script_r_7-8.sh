#!/bin/sh
python gen_kshot.py 19 7 sbertr
echo 'Finished generation for trec-dl-19 (k=7, sbertr)!'
python gen_kshot.py 20 7 sbertr
echo 'Finished generation for trec-dl-20 (k=7, sbertr)!'
python gen_kshot.py 19 8 sbertr
echo 'Finished generation for trec-dl-19 (k=8, sbertr)!'
python gen_kshot.py 20 8 sbertr
echo 'Finished generation for trec-dl-20! (k=8, sbertr)'
python process_raw_result.py 19 7 sbertr
echo 'Finished parsing for trec-dl-19! (k=7, sbertr)'
python process_raw_result.py 20 7 sbertr
echo 'Finished parsing for trec-dl-20! (k=7, sbertr)'
python process_raw_result.py 19 8 sbertr
echo 'Finished parsing for trec-dl-19! (k=8, sbertr)'
python process_raw_result.py 20 8 sbertr
echo 'Finished parsing for trec-dl-20! (k=8, sbert)'
python gen_kshot.py 19 7 bm25r
echo 'Finished generation for trec-dl-19 (k=7, bm25r)!'
python gen_kshot.py 20 7 bm25r
echo 'Finished generation for trec-dl-20 (k=7, bm25r)!'
python gen_kshot.py 19 8 bm25r
echo 'Finished generation for trec-dl-19 (k=8, bm25r)!'
python gen_kshot.py 20 8 bm25r
echo 'Finished generation for trec-dl-20! (k=8, bm25r)'
python process_raw_result.py 19 7 bm25r
echo 'Finished parsing for trec-dl-19! (k=7, bm25r)'
python process_raw_result.py 20 7 bm25r
echo 'Finished parsing for trec-dl-20! (k=7, bm25r)'
python process_raw_result.py 19 8 bm25r
echo 'Finished parsing for trec-dl-19! (k=8, bm25r)'
python process_raw_result.py 20 8 bm25r
echo 'Finished parsing for trec-dl-20! (k=8, bm25r)'