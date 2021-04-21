#!/bin/bash

if [ "$1" = "up" ]
then
	pulsemixer --change-volume +5
elif [ "$1" = "down" ]
then
	pulsemixer --change-volume -5
elif [ "$1" = "mpcU" ]
then
	mpc volume +5
elif [ "$1" = "mpcD" ]
then
	mpc volume -5
fi

pkill -RTMIN+2 dwmblocks
