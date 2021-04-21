#!/bin/bash

vol="$(pulsemixer --get-volume | sed 's/ .*//')"
dVol="$(echo $vol | sed -e 's/$/%/g')"

if [ $vol -gt 1 ]
then
	if [ $vol -lt 33 ]
	then
		echo -e '\ue04e '$dVol
	elif [ $vol -lt 66 ]
	then
		echo -e '\ue050 '$dVol
	else
		echo -e '\ue05d '$dVol
	fi
else
	echo -e '\ue04f '$dVol
fi
