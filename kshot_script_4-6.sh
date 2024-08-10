#!/bin/sh
python gen_kshot.py 19 4 sbert
echo 'Finished generation for trec-dl-19 (k=4, sbert)!'
python gen_kshot.py 20 4 sbert
echo 'Finished generation for trec-dl-20 (k=4, sbert)!'
python gen_kshot.py 19 5 sbert
echo 'Finished generation for trec-dl-19 (k=5, sbert)!'
python gen_kshot.py 20 5 sbert
echo 'Finished generation for trec-dl-20! (k=5, sbert)'
python gen_kshot.py 19 6 sbert
echo 'Finished generation for trec-dl-19 (k=6, sbert)!'
python gen_kshot.py 20 6 sbert
echo 'Finished generation for trec-dl-20! (k=6, sbert)'
python process_raw_result.py 19 4 sbert
echo 'Finished parsing for trec-dl-19! (k=4, sbert)'
python process_raw_result.py 20 4 sbert
echo 'Finished parsing for trec-dl-20! (k=4, sbert)'
python process_raw_result.py 19 5 sbert
echo 'Finished parsing for trec-dl-19! (k=5, sbert)'
python process_raw_result.py 20 5 sbert
echo 'Finished parsing for trec-dl-20! (k=5, sbert)'
python process_raw_result.py 19 6 sbert
echo 'Finished parsing for trec-dl-19! (k=6, sbert)'
python process_raw_result.py 20 6 sbert
echo 'Finished parsing for trec-dl-20! (k=6, sbert)'
python gen_kshot.py 19 4 bm25
echo 'Finished generation for trec-dl-19 (k=4, bm25)!'
python gen_kshot.py 20 4 bm25
echo 'Finished generation for trec-dl-20 (k=4, bm25)!'
python gen_kshot.py 19 5 bm25
echo 'Finished generation for trec-dl-19 (k=5, bm25)!'
python gen_kshot.py 20 5 bm25
echo 'Finished generation for trec-dl-20! (k=5, bm25)'
python gen_kshot.py 19 6 bm25
echo 'Finished generation for trec-dl-19 (k=6, bm25)!'
python gen_kshot.py 20 6 bm25
echo 'Finished generation for trec-dl-20! (k=6, bm25)'
python process_raw_result.py 19 4 bm25
echo 'Finished parsing for trec-dl-19! (k=4, bm25)'
python process_raw_result.py 20 4 bm25
echo 'Finished parsing for trec-dl-20! (k=4, bm25)'
python process_raw_result.py 19 5 bm25
echo 'Finished parsing for trec-dl-19! (k=5, bm25)'
python process_raw_result.py 20 5 bm25
echo 'Finished parsing for trec-dl-20! (k=5, bm25)'
python process_raw_result.py 19 6 bm25
echo 'Finished parsing for trec-dl-19! (k=6, bm25)'
python process_raw_result.py 20 6 bm25
echo 'Finished parsing for trec-dl-20! (k=6, bm25)'