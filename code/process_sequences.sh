#!/bin/bash
<<<<<<< HEAD
set -eou pipefail

# Kim Medina
# ctmedina2@dons.usfca.edu
# December 12, 2024
# Purpose of the script is to parse the file and tally the amount of sequences
# as well as sort the countries from largest to smallest

=======
>>>>>>> 65789ad25d64a4a3146345ce8f38389f522321b0

count=$(zgrep -c "^>" /blast-db/sars-cov-2-seq-data/2022-10-17_ncbi_sars-cov-2-sequences.fasta.gz)
echo "The amount of sequences in this file is: $count" > ../output/parse_result.txt

countries=$(zcat /blast-db/sars-cov-2-seq-data/2022-10-17_ncbi_sars-cov-2-sequences.fasta.gz | \awk '/^>/ {split($0, a, "|"); print a[length(a)-5]}' | \sort | \uniq -c | \sort -nr)
echo "These are the countries in the dataset sorted from largest to smallest: $countries" >> ../output/parse_result.txt
