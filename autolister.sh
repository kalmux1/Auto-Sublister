#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 domains.txt output.txt"
    exit 1
fi

# Input file containing domains
input_file="$1"
# Output file to store all subdomains
output_file="$2"

# Clear the output file if it exists
> "$output_file"

# Read the input file
while IFS= read -r domain; do
    echo " "
    echo " "
    echo "Running Sublist3r for ===> $domain"
    sublist3r -d "$domain" -v -t 150 -o temp_subdomains.txt
    cat temp_subdomains.txt >> "$output_file"
done < "$input_file"

# Remove the temporary file
rm temp_subdomains.txt