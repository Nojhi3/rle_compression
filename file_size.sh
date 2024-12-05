#!/bin/bash

# Function to retrieve the file size in bytes
file_size() {
    filename=$1

    if [ -f "$filename" ]; then
        size=$(stat -c %s "$filename")
        echo "File size of '$filename' in bytes: $size"
    else
        echo "Error: File '$filename' not found."
    fi
}

# Main function to take input and display file size
if [ -n "$1" ]; then
    file_size "$1"
else
    echo "Error: No file provided."
fi
