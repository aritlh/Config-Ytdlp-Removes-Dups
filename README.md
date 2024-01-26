Removes duplicates of 2nd row of previous line from the 1st row of the current line
(see 1st row of 11 [original])

Lines are still repeated but now it is the same row
(see 11 and 12)

```srt
10
00:00:19,670 --> 00:00:19,680
there is a free wireless internet signal

11
00:00:19,680 --> 00:00:21,769
there is a free wireless internet signal
all across North America and nobody has

12
00:00:21,769 --> 00:00:21,779
all across North America and nobody has
```

becomes

```srt
10
00:00:19,670 --> 00:00:19,680
there is a free wireless internet signal

11
00:00:19,680 --> 00:00:21,769
all across North America and nobody has

12
00:00:21,769 --> 00:00:21,779
all across North America and nobody has
```

## Requirement Deps

- yt-dlp
- ffmpeg

## Installation

- Clone this repo
- Enter the repo directory
- Run `chmod +x *`
- Run `./cyrd.sh`