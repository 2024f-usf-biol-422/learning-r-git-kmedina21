#!/bin/bash
set -euo pipefail


if [ "$#" -lt 3 ]; then
  echo "Error: You must provide at least three parameters."
  echo "Usage: $0 <input_file> <sample_id> <output_directory>"
  exit 1
fi

input_file="$1"
sample_id="$2"
output_directory="$3"

output_file="${output_directory}/Report_${sample_id}.html"

Rscript -e "rmarkdown::render('Report.Rmd', params = list(input_file = '$input_file', sample_id = '$sample_id'), output_file = '$output_file')"

echo "Report generated: $output_file"
