#!/bin/sh
python gen_kshot.py 19 7 sbert
echo 'Finished generation for trec-dl-19 (k=7, sbert)!'
python gen_kshot.py 20 7 sbert
echo 'Finished generation for trec-dl-20 (k=7, sbert)!'
python gen_kshot.py 19 8 sbert
echo 'Finished generation for trec-dl-19 (k=8, sbert)!'
python gen_kshot.py 20 8 sbert
echo 'Finished generation for trec-dl-20! (k=8, sbert)'
python process_raw_result.py 19 7 sbert
echo 'Finished parsing for trec-dl-19! (k=7, sbert)'
python process_raw_result.py 20 7 sbert
echo 'Finished parsing for trec-dl-20! (k=7, sbert)'
python process_raw_result.py 19 8 sbert
echo 'Finished parsing for trec-dl-19! (k=8, sbert)'
python process_raw_result.py 20 8 sbert
echo 'Finished parsing for trec-dl-20! (k=8, sbert)'
python gen_kshot.py 19 7 bm25
echo 'Finished generation for trec-dl-19 (k=7, bm25)!'
python gen_kshot.py 20 7 bm25
echo 'Finished generation for trec-dl-20 (k=7, bm25)!'
python gen_kshot.py 19 8 bm25
echo 'Finished generation for trec-dl-19 (k=8, bm25)!'
python gen_kshot.py 20 8 bm25
echo 'Finished generation for trec-dl-20! (k=8, bm25)'
python process_raw_result.py 19 7 bm25
echo 'Finished parsing for trec-dl-19! (k=7, bm25)'
python process_raw_result.py 20 7 bm25
echo 'Finished parsing for trec-dl-20! (k=7, bm25)'
python process_raw_result.py 19 8 bm25
echo 'Finished parsing for trec-dl-19! (k=8, bm25)'
python process_raw_result.py 20 8 bm25
echo 'Finished parsing for trec-dl-20! (k=8, bm25)'