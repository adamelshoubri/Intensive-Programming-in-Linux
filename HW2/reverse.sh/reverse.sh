#!/bin/bash

ls $1 | {
	while read item; do
		echo $item
		items+=($item)
	done

	echo "----"

	len=${#items[@]}
	while [ $len -gt 0 ]; do
		let "len--"
		echo ${items[len]}
	done
}
