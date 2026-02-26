#!/bin/bash

# Ensure that there are arguments passed to the script
if [ $# -eq 0 ]; then
  echo "Usage: $0 /path/to/directory/FileName.java"
  exit 1
fi

for file in "$@"; do
  if [[ -f "$file" ]]; then
    echo "Processing file: $file"
    TMP=$(mktemp --suffix=.java)

    cp "$file" "$TMP"
    java -jar /home/henrikas/.local/bin/google-java-format-1.34.1-all-deps.jar --replace "$TMP"
    cat "$TMP" >"$file"
    rm "$TMP"
  else
    echo "$file is not a valid file."
  fi
done
