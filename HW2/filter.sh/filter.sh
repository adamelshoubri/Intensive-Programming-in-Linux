#!/bin/bash

function filter {
	local dir=$1
	local avg=$2
	for item in $(ls $dir); do
		local size=$(du -b $dir/$item | awk '{print $1}')
		if [ $size -gt $avg ]; then
			echo "$item $avg $size"
		fi
	done
}

function average {
	local dir=$1
	local totalSize=0
	local numFiles=0
	for item in $(ls $dir); do
		local size=$(du -b $dir/$item | awk '{print $1}')
		let "totalSize+=size"
		let "numFiles++"
	done;
	echo $(expr $totalSize / $numFiles)
}

function main {
	filter $1 $(average $1)
}

if [ -z $1 ]; then
	main .
else
	main $1
fi
