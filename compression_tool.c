#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

// Function to compress file using Run-Length Encoding
void compress_file(const char *input_filename, const char *output_filename) {
    FILE *input_file = fopen(input_filename, "r");
    FILE *output_file = fopen(output_filename, "w");

    if (!input_file || !output_file) {
        printf("Error opening files.\n");
        return;
    }

    char current_char, next_char;
    int count;

    current_char = fgetc(input_file);
    while (current_char != EOF) {
        count = 1;
        next_char = fgetc(input_file);

        while (current_char == next_char && next_char != EOF) {
            count++;
            next_char = fgetc(input_file);
        }

        fprintf(output_file, "%c%d", current_char, count);
        current_char = next_char;
    }

    fclose(input_file);
    fclose(output_file);
    printf("File compressed successfully.\n");
}

// Function to decompress file using Run-Length Encoding
void decompress_file(const char *input_filename, const char *output_filename) {
    FILE *input_file = fopen(input_filename, "r");
    FILE *output_file = fopen(output_filename, "w");

    if (!input_file || !output_file) {
        printf("Error opening files.\n");
        return;
    }

    char current_char;
    int count;

    while (fscanf(input_file, "%c%d", &current_char, &count) != EOF) {
        for (int i = 0; i < count; i++) {
            fputc(current_char, output_file);
        }
    }

    fclose(input_file);
    fclose(output_file);
    printf("File decompressed successfully.\n");
}

// Function to retrieve the file size
long file_size(const char *filename) {
    struct stat st;
    if (stat(filename, &st) == 0) {
        return st.st_size;
    } else {
        printf("Error getting file size.\n");
        return -1;
    }
}

// Function to calculate compression ratio
void calculate_compression_ratio(const char *original_filename, const char *compressed_filename) {
    long original_size = file_size(original_filename);
    long compressed_size = file_size(compressed_filename);

    if (original_size != -1 && compressed_size != -1) {
        double ratio = (double)original_size / compressed_size;
        double percentage = ((double)original_size - compressed_size) / original_size * 100;
        printf("Compression Ratio: %.2f\n", ratio);
        printf("Compression Percentage: %.2f%%\n", percentage);
    }
}

int main() {
    // Example usage
    const char *input_filename = "input.txt";
    const char *compressed_filename = "compressed.txt";
    const char *decompressed_filename = "decompressed.txt";

    compress_file(input_filename, compressed_filename);
    decompress_file(compressed_filename, decompressed_filename);
    calculate_compression_ratio(input_filename, compressed_filename);

    return 0;
}
