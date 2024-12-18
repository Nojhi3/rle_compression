#!/bin/bash

# Usage: ./compress_image.sh <input_image> <output_image> <quality>

if [ $# -ne 3 ]; then
    echo "Usage: $0 <input_image> <output_image> <quality>"
    exit 1
fi

input_image=$1
output_image=$2
quality=$3

# Check if the input file exists
if [ ! -f "$input_image" ]; then
    echo "Error: Input image file does not exist."
    exit 1
fi

# Compress the image using ImageMagick
convert "$input_image" -quality "$quality" "$output_image"

# Check if the compression was successful
if [ $? -eq 0 ]; then
    echo "Image compressed successfully: $output_image"
else
    echo "Image compression failed."
    exit 1
fi
