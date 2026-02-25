#!/bin/bash

FILE="$1"
TMP=$(mktemp --suffix=.java)

cp "$FILE" "$TMP"
java -jar /home/henrikas/.local/bin/google-java-format-1.34.1-all-deps.jar --replace "$TMP"
cat "$TMP" >"$FILE"
rm "$TMP"
