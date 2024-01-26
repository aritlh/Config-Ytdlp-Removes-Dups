#!/bin/bash
cd out/
for video_file in *.mp4; do
    filename=$(basename "$video_file" .mp4)
    subtitle_file="${filename}.srt"
    if [ -f "$subtitle_file" ]; then
        ffmpeg -i "${filename}.mp4" -i "${filename}.srt" -c:v copy -c:a copy -c:s mov_text "${filename}_subbed.mp4"
    else
        echo "Subtitle file not found for ${filename}. Skipping..."
    fi
done
cd ..