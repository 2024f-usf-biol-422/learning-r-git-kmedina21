#!/bin/bash

count=$(zgrep -c "^>" /blast-db/sars-cov-2-seq-data/2022-10-17_ncbi_sars-cov-2-sequences.fasta.gz)
echo "The amount of sequences in this file is: $count"

