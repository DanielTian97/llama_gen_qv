#!/bin/sh
python gen_kshot.py 19 4 sbertr
echo 'Finished generation for trec-dl-19 (k=4, sbertr)!'
python gen_kshot.py 20 4 sbertr
echo 'Finished generation for trec-dl-20 (k=4, sbertr)!'
python gen_kshot.py 19 5 sbertr
echo 'Finished generation for trec-dl-19 (k=5, sbertr)!'
python gen_kshot.py 20 5 sbertr
echo 'Finished generation for trec-dl-20! (k=5, sbertr)'
python gen_kshot.py 19 6 sbertr
echo 'Finished generation for trec-dl-19 (k=6, sbertr)!'
python gen_kshot.py 20 6 sbertr
echo 'Finished generation for trec-dl-20! (k=6, sbertr)'
python process_raw_result.py 19 4 sbertr
echo 'Finished parsing for trec-dl-19! (k=4, sbertr)'
python process_raw_result.py 20 4 sbertr
echo 'Finished parsing for trec-dl-20! (k=4, sbertr)'
python process_raw_result.py 19 5 sbertr
echo 'Finished parsing for trec-dl-19! (k=5, sbertr)'
python process_raw_result.py 20 5 sbertr
echo 'Finished parsing for trec-dl-20! (k=5, sbert)'
python process_raw_result.py 19 6 sbertr
echo 'Finished parsing for trec-dl-19! (k=6, sbertr)'
python process_raw_result.py 20 6 sbertr
echo 'Finished parsing for trec-dl-20! (k=6, sbertr)'
python gen_kshot.py 19 4 bm25r
echo 'Finished generation for trec-dl-19 (k=4, bm25r)!'
python gen_kshot.py 20 4 bm25r
echo 'Finished generation for trec-dl-20 (k=4, bm25r)!'
python gen_kshot.py 19 5 bm25r
echo 'Finished generation for trec-dl-19 (k=5, bm25r)!'
python gen_kshot.py 20 5 bm25r
echo 'Finished generation for trec-dl-20! (k=5, bm25r)'
python gen_kshot.py 19 6 bm25r
echo 'Finished generation for trec-dl-19 (k=6, bm25r)!'
python gen_kshot.py 20 6 bm25r
echo 'Finished generation for trec-dl-20! (k=6, bm25r)'
python process_raw_result.py 19 4 bm25r
echo 'Finished parsing for trec-dl-19! (k=4, bm25r)'
python process_raw_result.py 20 4 bm25r
echo 'Finished parsing for trec-dl-20! (k=4, bm25r)'
python process_raw_result.py 19 5 bm25r
echo 'Finished parsing for trec-dl-19! (k=5, bm25r)'
python process_raw_result.py 20 5 bm25r
echo 'Finished parsing for trec-dl-20! (k=5, bm25r)'
python process_raw_result.py 19 6 bm25r
echo 'Finished parsing for trec-dl-19! (k=6, bm25r)'
python process_raw_result.py 20 6 bm25r
echo 'Finished parsing for trec-dl-20! (k=6, bm25r)'