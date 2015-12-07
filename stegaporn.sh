#!/bin/sh

PRIVATE_MESSAGE="$1"
VIDEO="http://www.youporn.com/watch/11583857/dillion-carter-in-rubber-duckie-debugging-intro-sfw/"

#rm -rf /tmp/stegaporn
mkdir tmp
cd tmp

#youtube-dl $VIDEO

cat > stega.srt <<EOF
1
00:00:00,000 -> 00:00:01,000
$PRIVATE_MESSAGE
EOF

mv *.mp4 input.mp4
docker run -it --rm -v $(pwd):/workdir -w /workdir cellofellow/ffmpeg:latest ffmpeg -i input.mp4 -f srt -i stega.srt output.mkv
