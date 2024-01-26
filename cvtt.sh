#!/bin/bash

# Loop through all .vtt files in current directory
for i in *.vtt;
do name=`echo $i | cut -d'.' -f1`;
    echo $name;s
    ffmpeg -i "$i" "${name}.srt";
done