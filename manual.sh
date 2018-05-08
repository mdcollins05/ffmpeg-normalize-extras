#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

file=$1

#Use this option to set the tempdir based on the path to the file we are operating on.
tempdir=$(dirname "${file}")

#Use this option to set the tempdir to a fixed location.
tempdir="/data/rw/media/tmp/"

#Use this option to set the path to ffmpeg, if it's not within $PATH
ffmpegdir="/home/matt/ffmpeg/ffmpeg-3.4.2-64bit-static/"

echo "Starting ${file}"

/usr/bin/time -f "%E at %P CPU" sh -c "FFMPEG_PATH='${ffmpegdir}' TEMP='${tempdir}' ffmpeg-normalize \"${file}\" -nt ebu --dual-mono -t -14 -c:a ac3 -ar 48000 -o \"${file}\" -f"

echo "Finished ${file}"
#echo "Finished ${file}" | tee -a /home/matt/ffmpeg-normalize-extras/process.log
