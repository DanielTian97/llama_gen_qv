#!/bin/sh
python gen_kshot.py 19 1 sbertr
echo 'Finished generation for trec-dl-19 (k=1, sbertr)!'
python gen_kshot.py 20 1 sbertr
echo 'Finished generation for trec-dl-20 (k=1, sbertr)!'
python gen_kshot.py 19 2 sbertr
echo 'Finished generation for trec-dl-19 (k=2, sbertr)!'
python gen_kshot.py 20 2 sbertr
echo 'Finished generation for trec-dl-20! (k=2, sbertr)'
python gen_kshot.py 19 3 sbertr
echo 'Finished generation for trec-dl-19 (k=3, sbertr)!'
python gen_kshot.py 20 3 sbertr
echo 'Finished generation for trec-dl-20! (k=3, sbertr)'
python process_raw_result.py 19 1 sbertr
echo 'Finished parsing for trec-dl-19! (k=1, sbertr)'
python process_raw_result.py 20 1 sbertr
echo 'Finished parsing for trec-dl-20! (k=1, sbertr)'
python process_raw_result.py 19 2 sbertr
echo 'Finished parsing for trec-dl-19! (k=2, sbertr)'
python process_raw_result.py 20 2 sbertr
echo 'Finished parsing for trec-dl-20! (k=2, sbert)'
python process_raw_result.py 19 3 sbertr
echo 'Finished parsing for trec-dl-19! (k=3, sbertr)'
python process_raw_result.py 20 3 sbertr
echo 'Finished parsing for trec-dl-20! (k=3, sbertr)'
python gen_kshot.py 19 1 bm25r
echo 'Finished generation for trec-dl-19 (k=1, bm25r)!'
python gen_kshot.py 20 1 bm25r
echo 'Finished generation for trec-dl-20 (k=1, bm25r)!'
python gen_kshot.py 19 2 bm25r
echo 'Finished generation for trec-dl-19 (k=2, bm25r)!'
python gen_kshot.py 20 2 bm25r
echo 'Finished generation for trec-dl-20! (k=2, bm25r)'
python gen_kshot.py 19 3 bm25r
echo 'Finished generation for trec-dl-19 (k=3, bm25r)!'
python gen_kshot.py 20 3 bm25r
echo 'Finished generation for trec-dl-20! (k=3, bm25r)'
python process_raw_result.py 19 1 bm25r
echo 'Finished parsing for trec-dl-19! (k=1, bm25r)'
python process_raw_result.py 20 1 bm25r
echo 'Finished parsing for trec-dl-20! (k=1, bm25r)'
python process_raw_result.py 19 2 bm25r
echo 'Finished parsing for trec-dl-19! (k=2, bm25r)'
python process_raw_result.py 20 2 bm25r
echo 'Finished parsing for trec-dl-20! (k=2, bm25r)'
python process_raw_result.py 19 3 bm25r
echo 'Finished parsing for trec-dl-19! (k=3, bm25r)'
python process_raw_result.py 20 3 bm25r
echo 'Finished parsing for trec-dl-20! (k=3, bm25r)'