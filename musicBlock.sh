#!/bin/bash

#progress () { # This is something that doesn't really work but I'm proud of the declaring of curTime and allTime and calculating that to something that's actually useful so it stays in. 
#	curTime="$(mpc status | sed -n 2p | awk '{print $3}' | awk '{split($0,a,"/"); print a[1]}' | awk '{split($0,a,":"); m=a[1]*60; print m+a[2]}')"
#	allTime="$(mpc -f %time% | sed -n 1p | awk '{split($0,a,":"); m=a[1]*60; print m+a[2]}')"
#	prog=$(bc <<< "scale=2; ($curTime / $allTime) * 100" | awk -F '.' '{print $1}')
#	a=0
#	progCount=0
#	dispProg=""
#	putIn=0
#	
#	until [ $prog -lt $a ] || [ $prog -eq $a ]
#	do
#		((a += 5 ))
#		((progCount++))
#	done
#
#	until [ ${#dispProg} -eq 20 ]
#	do
#		if [ $putIn -lt $progCount ]
#		then
#			dispProg+="$(echo '\ue000')"
#		else
#			dispProg+="$(echo '\ue001')"
#		fi
#		((putIn++))
#	done
#}

progress () {
	curProg=$(mpc status | sed -n 2p | awk '{print $4}' | cut -d "(" -f2 | cut -d "%" -f1)
	dProg=""
	a=${#dProg}
	calProg=$((a * 5))
	until [ $curProg -lt $calProg ] || [ $curProg -eq $calProg ]
	do
		dProg+="◼"
		a=${#dProg}
		calProg=$((a * 5))
	done

	until [ ${#dProg} -eq 20 ]
	do
		dProg+="◻"
	done
}

case $1 in
	set)
		case $2 in
			toggle)
				mpc toggle
				;;
			clear)
				mpc clear
				;;
			prev)
				mpc prev
				;;
			next)
				mpc next
				;;
		esac
		pkill -RTMIN+1 dwmblocks
		;;
	get)
		if [ $2 = status ]
		then
			if [ "$(mpc status | grep -o playing)" ]
			then
				progress
				echo -e "\ue058 $(mpc status | sed -n 3p | awk '{print $2}') $(mpc current) $dProg"
			elif [ "$(mpc status | grep paused)" ]
			then
				progress
				echo -e "\ue059 $(mpc status | sed -n 3p | awk '{print $2}') $(mpc current) $dProg"
			else
				echo -e "\ue05c Nothing Playing"
			fi
		fi
		if [ $2 = prog ]
		then
			progress
			echo -e $dProg
		fi
	;;
esac
