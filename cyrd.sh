#!/bin/bash
read -p "Enter youtube URL: " youtube_url
echo " "
echo "Select subtitle language:"
echo "1. id"
echo "2. en"
echo "3. Manual (write manual)"
read -p "Insert option (1/2/3): " sub_choice
echo " "
echo "Select video format:"
echo "1. mp4/720p"
echo "2. mp4/1080p"
echo "3. Manual (Insert manual)"
read -p "Insert option (1/2/3): "  vid_choice
echo " "
sub_lang=""
vid_format=""
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
        echo "Invalid"
        exit 1
    ;;
esac
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
        echo "Invalid"
        exit 1
    ;;
esac
yt-dlp --sub-format "vtt" --write-auto-subs --sub-langs "$sub_lang" --embed-chapters --embed-thumbnail -f "$vid_format" "$youtube_url"
bash cvtt.sh
bash rmdp.sh
bash embd.sh