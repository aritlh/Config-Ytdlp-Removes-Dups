#!/bin/bash
root_folder=$(pwd)
tmp_folder=$(mktemp -d)
out_folder="$root_folder/out"
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for f in $(find "$root_folder" -type f -iname "*.srt"); do
    output_file="${f/$root_folder/$out_folder}"
    mkdir -p "$(dirname "$output_file")"
    awk '!visited[$0]++' "$f" > "$tmp_folder/$(basename "$f")"
    mv "$tmp_folder/$(basename "$f")" "$f"
done
IFS=$SAVEIFS
rm -rf "$tmp_folder"
rm -rf *vtt
mv *.mp4 out/ && mv *.srt out/