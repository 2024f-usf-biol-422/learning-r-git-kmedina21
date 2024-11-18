#!/bin/bash

count=$(zgrep -c "^>" /blast-db/sars-cov-2-seq-data/2022-10-17_ncbi_sars-cov-2-sequences.fasta.gz)
echo "The amount of sequences in this file is: $count" > learning-r-git-kmedina21/output/parse_result.txt

countries=$(zcat /blast-db/sars-cov-2-seq-data/2022-10-17_ncbi_sars-cov-2-sequences.fasta.gz | \awk '/^>/ {split($0, a, "|"); print a[length(a)-5]}' | \sort | \uniq -c | \sort -nr)
echo "These are the countries in the dataset sorted from largest to smallest: $countries" >> learning-r-git-kmedina21/output/parse_result.txt
