#!/bin/bash

# Function to compress file using Run-Length Encoding
compress_file() {
    input_file=$1
    output_file=$2

    current_char=""
    count=0

    while IFS= read -r -n1 char; do
        if [ "$char" == "$current_char" ]; then
            ((count++))
        else
            if [ $count -gt 0 ]; then
                echo -n "$current_char$count" >> "$output_file"
            fi
            current_char=$char
            count=1
        fi
    done < "$input_file"
    echo -n "$current_char$count" >> "$output_file"
    echo "File compressed successfully."
}

# Main function to take input and call the compression function
if [ -f "$1" ]; then
    compress_file "$1" "$2"
else
    echo "Error: Input file not found."
fi
