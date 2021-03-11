#!/bin/bash

fullname=$(basename "$1")
fileextention=${fullname##*.}
filename="${fullname%.*}"

[ -n $3 ] && fileextention=$3

start1=
start2=
name1=
name2=
let i=0
let j=0

foldername=$filename

echo -n "Folder name : "
read buf

[ -n "$buf" ] && foldername=$buf

mkdir -p "$foldername"
while read line;
do
	start2=${line:0:8}
	name2=$(echo ${line:9} | tr [:upper:] [:lower:] | sed "s/\(\^\ \+\)|\(\ \+\$\)//g" | sed "s/\ /\-/g")
	if [ $i -ne "0" ]
	then
		num=`printf "%02d" $i`
		echo -n "[ $start1 -> $start2 ] splitting from $fullname to $num-$name1.$fileextention ..." &&
		ffmpeg -nostdin -loglevel -8 -i "$fullname" -ss $start1 -to $start2 -c copy "$foldername/$num-$name1.$fileextention" &&
		echo " [done]" &&
		let j++
	fi
	let i++
	start1=$start2
	name1=$name2

done < $2

num=`printf "%02d" $i`
echo -n "[ $start1 -> $start2 ] splitting from $fullname to $num-$name1.$fileextention ..." &&
ffmpeg -nostdin -loglevel -8 -i "$fullname" -ss $start1 -c copy "$filename/$num-$name1.$fileextention" &&
echo " [done]" &&
let j++
echo "$j chapter(s) created"
