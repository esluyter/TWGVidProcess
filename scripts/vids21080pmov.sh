#! /bin/bash

#file=$(echo ${PWD##*/} | tr -d '[:punct:]')

IFS=$(echo -en "\n\b")
shopt -s nullglob
for i in *.MXF
do
  ffmpeg -i "$i" -vcodec libx264 -s 1920x1080 -acodec copy "${i%.*}.MOV"
done

[[ -d to_delete ]] || mkdir to_delete
mv *.MXF to_delete
