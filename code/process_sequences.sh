#!/bin/bash
set -eou pipefail

# Kim Medina
# ctmedina2@dons.usfca.edu
# December 12, 2024
# Purpose of the script is to parse the file and tally the amount of sequences
# as well as sort the countries from largest to smallest

# Check if the correct number of arguments is passed (number of sequences)
if [ $# -ne 2 ]; then
  echo "Usage: $0 <input_fasta_file> <output_file>"
  echo "Example: $0 /path/to/input.fasta.gz /path/to/output.txt"
  exit 1
fi

# Assign input and output file paths from the arguments
input_file="$1"
output_file="$2"

# Check if the input file exists and is readable
if [ ! -f "$input_file" ]; then
  echo "Error: The input file '$input_file' does not exist or is not a regular file."
  exit 1
fi

# Check if the output directory exists and is writable
output_dir=$(dirname "$output_file")
if [ ! -d "$output_dir" ]; then
  echo "Error: The output directory '$output_dir' does not exist."
  exit 1
elif [ ! -w "$output_dir" ]; then
  echo "Error: The output directory '$output_dir' is not writable."
  exit 1
fi

# Count sequences in the fasta file using zgrep
if ! zgrep -c "^>" "$input_file"; then
  echo "Error: Failed to count sequences in '$input_file'."
  exit 1
fi

# Output the result to the specified output file
count=$(zgrep -c "^>" "$input_file")
echo "The amount of sequences in this file is: $count" > "$output_file"

# Success message
echo "The sequence count has been written to '$output_file'."

# Process the input file to extract countries and count occurrences
if ! countries=$(zcat "$input_file" | awk '/^>/ {split($0, a, "|"); print a[length(a)-5]}' | sort | uniq -c | sort -nr); then
  echo "Error: Failed to process the input file '$input_file'."
  exit 1
fi

# Output the result to the specified output file
echo "These are the countries in the dataset sorted from largest to smallest:" >> "$output_file"
echo "$countries" >> "$output_file"

# Success message
echo "The country distribution has been written to '$output_file'."
