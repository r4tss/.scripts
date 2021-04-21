#!/bin/bash

Time="$(echo | dmenu -p "hhmm Set your alarm")"
if [ ${#Time} -eq 4 ]
then
	cat /tmp/scripts/alarmID | kill -s SIGKILL
	echo $$ > /tmp/scripts/alarmID
	echo -e "\ue0a7$(echo $Time | cut -b -2):$(echo $Time | cut -b 3-)" > /tmp/scripts/alarm && pkill -RTMIN+3 dwmblocks
	Go=1
fi

while [ $Go -eq 1 ]
do
	if [ $Time = $(date +"%H%M") ]
	then
		mpv --no-terminal $HOME/.scripts/alarm.opus &
		Go=0
		echo -e "\ue0a7 --:--" > /tmp/scripts/alarm && pkill -RTMIN+3 dwmblocks
	fi
	sleep 1s
done
