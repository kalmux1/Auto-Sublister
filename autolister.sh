#!/bin/bash

# Check if the script is running with sudo
if [[ $EUID -ne 0 ]]; then
   echo " "
   echo -e "\e[31mWARNING: This script must be run as root! Please use sudo.\e[0m"
   exit 1
fi

# Check if sublist3r is installed
if ! command -v sublist3r &> /dev/null
then
    echo " "
    echo "sublist3r could not be found, installing it now..."
    pip install sublist3r &> /dev/null
    if ! command -v sublist3r &> /dev/null
    then
        echo " "
        echo "sublist3r installation failed. Please install it manually."
        exit 1
    fi
fi

# Check if the input and output files are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo " "
    echo -e "\e[32mUsage:\e[0m \e[31m$0\e[0m \e[33mdomains.txt output.txt\e[0m"
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
    echo -e "\e[36mRunning Sublist3r for ===>\e[0m \e[32m$domain\e[0m"
    echo " "
    sublist3r -d "$domain" -v -t 150 -o temp_subdomains.txt

    if [ -f temp_subdomains.txt ]; then
        cat temp_subdomains.txt >> "$output_file"
        rm temp_subdomains.txt
    else
        echo " "
        echo -e "\e[31mNo subdomains found for $domain \e[0m"
    fi
done < "$input_file"
