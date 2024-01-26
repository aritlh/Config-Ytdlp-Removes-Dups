#!/bin/bash
read -p "Enter youtube URL: " youtube_url
echo

echo "Select subtitle language:"
echo "1. Id"
echo "2. En"
echo "3. Insert manually (e.g. jp)"
read -p "Insert option (1/2/3): " sub_choice
echo

echo "Select video format:"
echo "1. mp4/720p"
echo "2. mp4/1080p"
echo "3. Insert manually (e.g mp4/480p)"
read -p "Insert option (1/2/3): "  vid_choice
echo

sub_lang=""
vid_format=""

# Choice sub language
case $sub_choice in
    1)
        sub_lang="id"
    ;;
    2)
        sub_lang="en"
    ;;
    3)
        read -p "Enter the language code of manual subs: " sub_lang
    ;;
    *)
        echo "Invalid command"
        exit 1
    ;;
esac

# Choice video format
case $vid_choice in
    1)
        vid_format="mp4/720p"
    ;;
    2)
        vid_format="mp4/1080p"
    ;;
    3)
        read -p "Enter the manual format: " vid_format
    ;;
    *)
        echo "Invalid command"
        exit 1
    ;;
esac

# Exec yt-dlp command
yt-dlp --sub-format "vtt" --write-auto-subs --sub-langs "$sub_lang" --embed-chapters --embed-thumbnail -f "$vid_format" "$youtube_url"
echo

# Convert .ttv
read -p "You want to convert ttv file and remove dups? (y/n) " ttv_convert_rm_dups
if [[ "$ttv_convert_rm_dups" == "y" ||  "$ttv_convert_rm_dups" == "yes" ]]; then
    bash cvtt.sh
    sleep 2
    bash rmdp.sh
else
    echo "Request cancelled"
fi
echo

# Embed sub to .mp4
read -p "You want to embed sub? (y/n) " embed_sub
if [[ "$embed_sub" == "y" || "$embed_sub" == "yes" ]]; then
    bash embd.sh
else
    echo "Request cancelled"
fi