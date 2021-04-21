#!/bin/bash

case $1 in
	copy)
		maim -su | xclip -selection clipboard -t image/png -i
		;;
	save)
		maim -su > /tmp/scripts/tmppic.png && path=$(echo | dmenu -p "$HOME/Pictures/") && mv /tmp/scripts/tmppic.png $HOME/Pictures/$path.png
		;;
	choose)
		maim -su > /tmp/scripts/tmppic.png
		path=$(echo | dmenu -p "$HOME/Pictures/ Choose path or leave blank to copy")
		if [ ${#path} -lt 0 ]
		then
			xclip -selection clipboard -t image/png -i /tmp/scripts/tmppic.png
		else
			mv /tmp/scripts/tmppic.png $HOME/Pictures/$path.png
		fi
		;;
esac
