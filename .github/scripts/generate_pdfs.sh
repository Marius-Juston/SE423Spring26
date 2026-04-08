#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e 

# Default to "workspace" if the environment variable is not set
TARGET_FOLDER="${TARGET_FOLDER:-workspace}"
OUTPUT_DIR="output_pdfs"

mkdir -p "$OUTPUT_DIR"

# Find .c files exactly one subfolder deep (e.g., workspace/*/*.c)
find "$TARGET_FOLDER" -mindepth 2 -maxdepth 2 -type f -name "*.c" | while read -r file; do
  if grep -q -P '\bmain\s*\(' "$file"; then
    echo "Converting: $file"
    
    # Extract just the filename without the path and extension
    base_name=$(basename "$file" .c)
    
    # Generate HTML and convert to PDF
    pygmentize -f html -O full,style=tango,linenos=1 -l c -o temp.html "$file"
    wkhtmltopdf --enable-local-file-access temp.html "$OUTPUT_DIR/${base_name}.pdf"
    
    echo "Created: $OUTPUT_DIR/${base_name}.pdf"
  fi
done

# Clean up the temporary HTML file
rm -f temp.html