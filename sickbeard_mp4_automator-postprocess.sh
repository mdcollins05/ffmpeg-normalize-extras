#!/bin/bash

files=$(echo "${MH_FILES%%,*}" | sed 's/[]"[]//g')

for file in "${files%%.*}"* ; do
  if [[ $file == *mp4 ]];
  then
    tempdir=$(dirname "${file}")
    tempdir="/data/rw/media/tmp/"
    PATH="/home/matt/ffmpeg/ffmpeg-3.4.2-64bit-static/:${PATH}" TEMP="${tempdir}" ffmpeg-normalize "${file}" -nt ebu --dual-mono -t -14 -c:a ac3 -ar 48000 -o "${file}" -f -v
  fi
done

