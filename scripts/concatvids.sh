#! /bin/bash

file=$(echo ${PWD##*/} | tr -d '[:punct:]')

printf "file '%s'\n" ./*.MP4 > list.txt
ffmpeg -f concat -safe 0 -i list.txt -c:v copy "$file.mp4"
rm list.txt
mkdir to_delete
mv *.MP4 to_delete
