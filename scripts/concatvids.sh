#! /bin/bash

file=$(echo ${PWD##*/} | tr -d '[:punct:]')

mv */*.MP4 .
rmdir *
printf "file '%s'\n" *.MP4 > list.txt
ffmpeg -f concat -safe 0 -i list.txt -c:v copy "$file.mp4"
rm list.txt

[[ -d to_delete ]] || mkdir to_delete
mv *.MP4 to_delete
