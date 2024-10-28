#!/bin/bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Error: You must provide at least two parameters."
  echo "Usage: $0 <input_file> <sample_id>"
  exit 1
fi

input_file="$1"
sample_id="$2"

output_file="${output_directory}/Report_${sample_id}.html"

Rscript -e "rmarkdown::render('Report.Rmd', params = list(input_file = 'data/sample_snp_data.csv', sample_id = 'SRR12433063'))"

