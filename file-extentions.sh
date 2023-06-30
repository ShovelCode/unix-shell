#!/bin/bash

# Count the number of files in each subdirectory of the current directory
for dir in */; do
    files_count=$(find "$dir" -type f | wc -l)
    echo "Directory '$dir' contains $files_count files."
done

# Find and list all unique file extensions in the current directory
find . -type f | sed -E 's/.*\.([^.]+)$/\1/' | sort -u

# Calculate the total size of all JPEG files in the current directory and its subdirectories
total_size=$(find . -type f -name '*.jpg' -exec du -ch {} + | grep total$ | awk '{print $1}')
echo "Total size of JPEG files: $total_size"

# Rename all files with a '.txt' extension to have a '.bak' extension
for file in *.txt; do
    mv "$file" "${file%.txt}.bak"
done
