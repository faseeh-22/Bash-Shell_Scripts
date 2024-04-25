

#!/bin/bash

file="$1"
extension="$2"
if [ -e "$file" ]
# Add the extension to the file
  then
    new_file="${file%.*}.$extension"
    mv "$file" "$new_file"
    echo "Extension added. Renamed to $new_file"
  else
    echo "File does not exist: $file"
    exit 1
fi

