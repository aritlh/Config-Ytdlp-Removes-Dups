#!/bin/bash

# Set initial variables and states
root_folder=$(pwd)
tmp_folder=$(mktemp -d)
out_folder="$root_folder/out"
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# Loop through all .srt files
for f in $(find "$root_folder" -type f -iname "*.srt"); do
    output_file="${f/$root_folder/$out_folder}"
    mkdir -p "$(dirname "$output_file")"
    awk '!visited[$0]++' "$f" > "$tmp_folder/$(basename "$f")"
    mv "$tmp_folder/$(basename "$f")" "$f"
done

# Restore original IFS
IFS=$SAVEIFS

# Cleanup
rm -rf "$tmp_folder"
rm -rf *vtt

# Move .mp4 and .srt files to output folder
mv *.mp4 out/ && mv *.srt out/