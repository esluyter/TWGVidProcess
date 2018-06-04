#! /bin/bash

#file=$(echo ${PWD##*/} | tr -d '[:punct:]')

IFS=$(echo -en "\n\b")
shopt -s nullglob
for i in *.MXF
do
  ffmpeg -i "$i" -vcodec libx264 -s 1920x1080 -acodec copy "${i%.*}.MOV"
done

if [[ ! -e $to_delete]]
then
  mkdir to_delete
fi
mv *.MXF to_delete
