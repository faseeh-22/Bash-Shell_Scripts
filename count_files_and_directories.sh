

#!/bin/bash

# Check if a directory path is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_path>"
  exit 1
fi

# Get the directory path from the command line argument
directory="$1"

# Check if the provided path is a directory
if [ ! -d "$directory" ]; then
  echo "Error: '$directory' is not a directory."
  exit 1
fi

# Use find to count the number of files and directories in the specified directory
num_files=$(find "$directory" -type f | wc -l)
num_directories=$(find "$directory" -type d | wc -l)

echo "Number of files in '$directory': $num_files"
echo "Number of directories in '$directory': $num_directories"





