#!/bin/bash

# Function to decompress file using Run-Length Encoding
decompress_file() {
    input_file=$1
    output_file=$2

    while IFS= read -r -n2 pair; do
        char=${pair:0:1}
        count=${pair:1}

        for ((i = 0; i < $count; i++)); do
            echo -n "$char" >> "$output_file"
        done
    done < "$input_file"
    echo "File decompressed successfully."
}

# Main function to take input and call the decompression function
if [ -f "$1" ]; then
    decompress_file "$1" "$2"
else
    echo "Error: Input file not found."
fi
