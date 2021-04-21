#!/bin/bash

w=$(curl -s "https://opendata-download-metanalys.smhi.se/api/category/mesan1g/version/2/geotype/point/lon/$1/lat/$2/data.json")
t=$(echo $w | jq '.timeSeries' | jq '.[0].parameters' | jq -c '.[] | select (.name=="t") | .values' | awk -F '[][]' '{print $2}')
i=$(echo $w | jq '.timeSeries' | jq '.[0].parameters' | jq -c '.[] | select (.name=="Wsymb2") | .values' | awk -F '[][]' '{print $2}')
time=$(date +'%H')
case $i in
	1|2)
		if [ $time -gt 6 ] && [ $time -lt 18 ]
		then
			di="\ue234"
		else
			di="\ue233"
		fi
		;;
	3|4|5)
		if [ $time -gt 6 ] && [ $time -lt 18 ]
		then
			di="\ue231"
		else
			di="\ue232"
		fi
		;;
	6|7)
		di="\ue22b"
		;;
	8|9|15|16|18|19|25|26)
		di="\ue230"
		;;
	12|13|22|23)
		di="\ue22d"
		;;
	10|14|20|27)
		di="\ue22f"
		;;
	17|24)
		di="\ue22e"
		;;
	11|21)
		di="\ue22c"
		;;
esac
echo -e "$di $t°C"
