#!/bin/sh
python gen_kshot.py 19 9 sbert
echo 'Finished generation for trec-dl-19 (k=9, sbert)!'
python gen_kshot.py 20 9 sbert
echo 'Finished generation for trec-dl-20 (k=9, sbert)!'
python gen_kshot.py 19 10 sbert
echo 'Finished generation for trec-dl-19 (k=10, sbert)!'
python gen_kshot.py 20 10 sbert
echo 'Finished generation for trec-dl-20! (k=10, sbert)'
python process_raw_result.py 19 9 sbert
echo 'Finished parsing for trec-dl-19! (k=9, sbert)'
python process_raw_result.py 20 9 sbert
echo 'Finished parsing for trec-dl-20! (k=9, sbert)'
python process_raw_result.py 19 10 sbert
echo 'Finished parsing for trec-dl-19! (k=10, sbert)'
python process_raw_result.py 20 10 sbert
echo 'Finished parsing for trec-dl-20! (k=10, sbert)'
python gen_kshot.py 19 9 bm25
echo 'Finished generation for trec-dl-19 (k=9, bm25)!'
python gen_kshot.py 20 9 bm25
echo 'Finished generation for trec-dl-20 (k=9, bm25)!'
python gen_kshot.py 19 10 bm25
echo 'Finished generation for trec-dl-19 (k=10, bm25)!'
python gen_kshot.py 20 10 bm25
echo 'Finished generation for trec-dl-20! (k=10, bm25)'
python process_raw_result.py 19 9 bm25
echo 'Finished parsing for trec-dl-19! (k=9, bm25)'
python process_raw_result.py 20 9 bm25
echo 'Finished parsing for trec-dl-20! (k=9, bm25)'
python process_raw_result.py 19 10 bm25
echo 'Finished parsing for trec-dl-19! (k=10, bm25)'
python process_raw_result.py 20 10 bm25
echo 'Finished parsing for trec-dl-20! (k=10, bm25)'