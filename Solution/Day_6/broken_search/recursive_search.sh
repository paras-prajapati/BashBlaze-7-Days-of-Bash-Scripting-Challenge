#!/bin/bash

# Input
# Check if a file path is provided as a command-line argument

if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi

search_directory=$1
target_file=$2

# TODO: Implement the recursive search logic here


# Function to perform the recursive search
recursive_search() {
  local dir="$1"
  
  for file in "$dir"/*; do
    if [ -d "$file" ]; then
      recursive_search "$file"
    elif [ -f "$file" ] && [ "$(basename "$file")" == "$target_file" ]; then
      echo "File found: $file"
      exit 0
    fi
  done
}

# Check if the search directory exists
if [ ! -d "$search_directory" ]; then
  echo "Directory not found: $search_directory"
  exit 1
fi

# Call the recursive search function
recursive_search "$search_directory"

# If the script reaches here, the target file was not found
echo "File not found: $target_file"
exit 1

