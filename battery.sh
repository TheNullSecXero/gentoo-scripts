#!/bin/bash

while true;
do
    BATTERY=$(acpitool -b | cut -d":" -f 2-5)
    STATUS=$(echo $BATTERY | cut -d"," -f 1)
    PERCENT=$(acpitool -b | cut -d"," -f 2 | cut -d"." -f 1)

	if [[ $STATUS == *"discharging"* ]];
	then
        if [[ $PERCENT -lt "5" ]];
		then
            amixer sset 'Beep' unmute > /dev/null
			beep
            amixer sset 'Beep' mute > /dev/null
		fi
	fi
    
    echo $BATTERY 
	sleep 10
done

