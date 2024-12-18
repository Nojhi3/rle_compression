#!/bin/bash

# Compress an image with specified quality
compress_image() {
    magick "$1" -quality "$2" "compressed_$1"
    echo "Image compressed as compressed_$1 with quality $2"
}

# Decompress an image (convert to BMP)
decompress_image() {
    magick "$1" "decompressed_${1%.*}.bmp"
    echo "Image decompressed as decompressed_${1%.*}.bmp"
}

# Usage
if [ "$1" == "compress" ]; then
    compress_image "$2" "$3"
elif [ "$1" == "decompress" ]; then
    decompress_image "$2"
else
    echo "Usage: $0 [compress|decompress] [image_file] [quality (for compress)]"
fi
