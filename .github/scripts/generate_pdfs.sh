#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e 

# Default to "workspace" if the environment variable is not set
TARGET_FOLDER="${TARGET_FOLDER:-workspace}"
OUTPUT_DIR="output_pdfs"

# Reference directory for standard C2000 files
C2000WARE_DIR="./C2000Ware_4_01_00_00/device_support/f2837xd/examples/cpu1"

mkdir -p "$OUTPUT_DIR"

# 1. Find all unique directories that contain .c files at the specified depth
find "$TARGET_FOLDER" -mindepth 3 -maxdepth 3 -type f -name "*.c" -exec dirname {} \; | sort -u | while read -r dir; do
  
  # Extract the project folder name (e.g., "ProjectA")
  rel_path="${dir#"$TARGET_FOLDER"/}" 
  project_name=$(echo "$rel_path" | cut -d'/' -f1)
  
  echo "Processing folder: $dir (Project: $project_name)"
  
  # Initialize variables to control the exact merge order
  main_pdf=""
  serial_pdf=""
  other_pdfs=()
  all_temp_pdfs=() # Used strictly for cleanup later

  # Enable nullglob so the loop operates safely
  shopt -s nullglob
  
  # 2. Loop through every .c file in this specific directory
  for file in "$dir"/*.c; do
    filename=$(basename "$file")
    generate_pdf=false

    # CONDITION 1: Is it the Serial library file?
    if [[ "$filename" == "F28379dSerial.c" ]]; then
      match_found=false
      for ref_file in "$C2000WARE_DIR"/*/cpu01/F28379dSerial.c; do
        if cmp -s "$file" "$ref_file"; then
          match_found=true
          break
        fi
      done

      if [ "$match_found" = false ]; then
        generate_pdf=true
        echo "  -> Including custom $filename"
      else
        echo "  -> Skipping default C2000Ware $filename"
      fi

    # CONDITION 2: Does it contain a main function?
    elif grep -q -P '\bmain\s*\(' "$file"; then
      generate_pdf=true
      echo "  -> Including $filename (contains main)"
    fi

    # 3. Generate HTML and individual PDF for the file
    if [ "$generate_pdf" = true ]; then
      base_name="${filename%.c}"
      
      temp_html="temp_${base_name}.html"
      temp_pdf="temp_${base_name}.pdf"
      
      # Generate HTML
      pygmentize -f html -O full,style=default,linenos=1 -l c -o "$temp_html" "$file"

      # Inject Code Composer Studio theme (Blue numbers)
      sed -i 's|</style>|\
        /* Numbers (Integers, Floats, Hex, Octal, etc.) */\
        .m, .mb, .mf, .mh, .mi, .mo, .il { color: #2A00FF !important; font-weight: normal !important; }\
      </style>|' "$temp_html"

      # Generate a single PDF for this specific file
      wkhtmltopdf --quiet --enable-local-file-access "$temp_html" "$temp_pdf"

      # --- ORDERING LOGIC ---
      # Sort the generated PDF into the correct variable/array
      if [[ "$filename" == "F28379dSerial.c" ]]; then
        serial_pdf="$temp_pdf"
      elif grep -q -P '\bmain\s*\(' "$file"; then
        main_pdf="$temp_pdf"
      else
        other_pdfs+=("$temp_pdf")
      fi
      
      all_temp_pdfs+=("$temp_pdf")
      
      # Clean up the HTML file immediately
      rm -f "$temp_html"
    fi
  done
  
  # Disable nullglob for safety
  shopt -u nullglob

  # 4. Assemble the final PDF array in the exact requested order
  ordered_pdfs=()
  if [ -n "$main_pdf" ]; then ordered_pdfs+=("$main_pdf"); fi
  if [ -n "$serial_pdf" ]; then ordered_pdfs+=("$serial_pdf"); fi
  ordered_pdfs+=("${other_pdfs[@]}") # Appends any other files, just in case

  # 5. If we generated PDFs, stitch them together using qpdf
  if [ ${#ordered_pdfs[@]} -gt 0 ]; then
    pdf_filename="${project_name}.pdf"
    
    # Merge all individual PDFs into the final output file
    qpdf --empty --pages "${ordered_pdfs[@]}" -- "$OUTPUT_DIR/$pdf_filename"
    
    echo "Successfully created combined PDF: $OUTPUT_DIR/$pdf_filename (Order: Main -> Serial)"
    
    # Clean up the temporary single-page PDFs
    rm -f "${all_temp_pdfs[@]}"
  else
    echo "No matching files needed compiling in $dir"
  fi
  
  echo "---------------------------------------------------"
done