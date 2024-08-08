#!/bin/sh
python gen_kshot.py 19 1 sbert
echo 'Finished generation for trec-dl-19 (k=1, sbert)!'
python gen_kshot.py 20 1 sbert
echo 'Finished generation for trec-dl-20! (k=1, sbert)'
python gen_kshot.py 19 2 sbert
echo 'Finished generation for trec-dl-19 (k=2, sbert)!'
python gen_kshot.py 20 2 sbert
echo 'Finished generation for trec-dl-20! (k=2, sbert)'
python gen_kshot.py 19 3 sbert
echo 'Finished generation for trec-dl-19 (k=3, sbert)!'
python gen_kshot.py 20 3 sbert
echo 'Finished generation for trec-dl-20! (k=3, sbert)'
python process_raw_result.py 19 1 sbert
echo 'Finished parsing for trec-dl-19! (k=1, sbert)'
python process_raw_result.py 20 1 sbert
echo 'Finished parsing for trec-dl-20! (k=1, sbert)'
python process_raw_result.py 19 2 sbert
echo 'Finished parsing for trec-dl-19! (k=2, sbert)'
python process_raw_result.py 20 2 sbert
echo 'Finished parsing for trec-dl-20! (k=2, sbert)'
python process_raw_result.py 19 3 sbert
echo 'Finished parsing for trec-dl-19! (k=3, sbert)'
python process_raw_result.py 20 3 sbert
echo 'Finished parsing for trec-dl-20! (k=3, sbert)'
python gen_kshot.py 19 1 bm25
echo 'Finished generation for trec-dl-19 (k=1, bm25)!'
python gen_kshot.py 20 1 bm25
echo 'Finished generation for trec-dl-20! (k=1, bm25)'
python gen_kshot.py 19 2 bm25
echo 'Finished generation for trec-dl-19 (k=2, bm25)!'
python gen_kshot.py 20 2 bm25
echo 'Finished generation for trec-dl-20! (k=2, bm25)'
python gen_kshot.py 19 3 bm25
echo 'Finished generation for trec-dl-19 (k=3, bm25)!'
python gen_kshot.py 20 3 bm25
echo 'Finished generation for trec-dl-20! (k=3, bm25)'
python process_raw_result.py 19 1 bm25
echo 'Finished parsing for trec-dl-19! (k=1, bm25)'
python process_raw_result.py 20 1 bm25
echo 'Finished parsing for trec-dl-20! (k=1, bm25)'
python process_raw_result.py 19 2 bm25
echo 'Finished parsing for trec-dl-19! (k=2, bm25)'
python process_raw_result.py 20 2 bm25
echo 'Finished parsing for trec-dl-20! (k=2, bm25)'
python process_raw_result.py 19 3 bm25
echo 'Finished parsing for trec-dl-19! (k=3, bm25)'
python process_raw_result.py 20 3 bm25
echo 'Finished parsing for trec-dl-20! (k=3, bm25)'