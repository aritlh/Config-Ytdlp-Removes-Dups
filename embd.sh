#!/bin/bash

# Go to out folder
cd out

#Get the mp4 and srt file names
mp4=$(ls *.mp4)
srt=$(ls *.srt)

# Embed subtitles and add _subbed suffix
base_name="${mp4%.*}"
ffmpeg -i "$mp4" -i "$srt" -c:v copy -c:a copy -c:s mov_text "$base_name"_subbed.mp4

# Move output file to finished folder
mkdir -p ../finished
mv *subbed.mp4 ../finished
# mv *.srt ../finished

rm -r *.srt
rm -r *.mp4

# Go back to parent folder
cd ..

# Delete original out folder
rm -r out