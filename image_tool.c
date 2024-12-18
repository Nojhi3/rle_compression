#include <stdlib.h>  // For system()
#include <stdio.h>   // For printf()

int main() {
    // Command to compress the image
    const char *command = "magick convert input.jpg -quality 75 compressed.jpg";

    // Execute the command
    int result = system(command);

    if (result == 0) {
        printf("Image compressed successfully.\n");
    } else {
        printf("Failed to compress the image.\n");
    }

    return 0;
}
