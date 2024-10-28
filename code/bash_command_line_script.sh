#!/bin/bash
set -euo pipefail

Rscript -e "rmarkdown::render('Report.Rmd', params = list(input_file = 'data/sample_snp_data.csv', sample_id = 'SRR12433063'))"
