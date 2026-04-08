#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e 

# Default to "workspace" if the environment variable is not set
TARGET_FOLDER="${TARGET_FOLDER:-workspace}"
OUTPUT_DIR="output_pdfs"

mkdir -p "$OUTPUT_DIR"

# Find .c files exactly one subfolder deep (e.g., workspace/*/*.c)
find "$TARGET_FOLDER" -mindepth 3 -maxdepth 3 -type f -name "*.c" | while read -r file; do
  if grep -q -P '\bmain\s*\(' "$file"; then
    echo "Converting: $file"
    
    # Extract just the filename without the path and extension
    base_name=$(basename "$file" .c)
    
    # Generate HTML and convert to PDF
    pygmentize -f html -O full,style=default,linenos=1 -l c -o temp.html "$file"

  # INJECT CODE COMPOSER STUDIO THEME
    # We use sed to replace the closing </style> tag with our custom CSS block
    # sed -i 's|</style>|\
    #   /* Keywords (int, void, if, return) */\
    #   .k, .kt { color: #7F0055 !important; font-weight: bold !important; }\
    #   /* Strings ("Hello World") and Preprocessor Files (<stdio.h>) */\
    #   .s, .s2, .se, .cpf { color: #2A00FF !important; font-weight: normal !important; }\
    #   /* Comments (// and /* */) */\
    #   .c, .c1, .cm { color: #3F7F5F !important; font-style: normal !important; }\
    #   /* Preprocessor Directives (#define, #pragma) */\
    #   .cp { color: #708090 !important; font-weight: bold !important; }\
    #   /* Numbers (Integers, Floats, Hex, Octal, etc.) */\
    #   .m, .mb, .mf, .mh, .mi, .mo, .il { color: #0000FF !important; font-weight: normal !important; }\
    # </style>|' temp.html

  # INJECT CODE COMPOSER STUDIO THEME (Now with Blue Numbers)
    # We use sed to replace the closing </style> tag with our custom CSS block
    sed -i 's|</style>|\
      /* Numbers (Integers, Floats, Hex, Octal, etc.) */\
      .m, .mb, .mf, .mh, .mi, .mo, .il { color: #2A00FF !important; font-weight: normal !important; }\
    </style>|' temp.html

    wkhtmltopdf --enable-local-file-access temp.html "$OUTPUT_DIR/${base_name}.pdf"
    
    echo "Created: $OUTPUT_DIR/${base_name}.pdf"
  fi
done

# Clean up the temporary HTML file
rm -f temp.html