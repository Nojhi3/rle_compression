#!/bin/bash

# Function to calculate the compression ratio
compression_ratio() {
    original_file=$1
    compressed_file=$2

    # Check if the files exist
    if [ ! -f "$original_file" ]; then
        echo "Error: File '$original_file' not found."
        return
    fi

    if [ ! -f "$compressed_file" ]; then
        echo "Error: File '$compressed_file' not found."
        return
    fi

    # Get the file sizes in bytes
    original_size=$(stat -c %s "$original_file")
    compressed_size=$(stat -c %s "$compressed_file")

    # Calculate the compression ratio
    if [ "$original_size" -eq 0 ]; then
        echo "Error: Original file is empty, cannot calculate compression ratio."
        return
    fi

    compression_ratio=$(echo "$original_size / $compressed_size" | awk '{print $1}')
    compression_percentage=$(echo "scale=2; ($compressed_size / $original_size) * 100" | awk '{print $1}')

    # Output the results
    echo "Original file size: $original_size bytes"
    echo "Compressed file size: $compressed_size bytes"
    echo "Compression Ratio: $compression_ratio"
    echo "Compression Percentage: $compression_percentage%"
}

# Main function to take input and call the compression_ratio function
if [ -n "$1" ] && [ -n "$2" ]; then
    compression_ratio "$1" "$2"
else
    echo "Error: Please provide both original and compressed file paths."
fi
