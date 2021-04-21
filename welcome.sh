#!/bin/bash
a=$(calcurse -Q --days 8)

echo -e "Welcome $USER\nThe date is $(date +'%D '"And the time is"' %R')\n"
if [ -n "$a" ]
then
	echo -e "These are your appointments for the week\n\n$a"
else
	echo -e "You've no appointments for this week"
fi
read -sn 1
