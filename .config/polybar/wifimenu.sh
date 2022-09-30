#!/usr/bin/env bash

# this prints a beautifully formatted list. bash was a mistake
nmcli -t d wifi rescan
LIST=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

# get current connection status
CONSTATE=$(nmcli -fields WIFI g)
if [[ "$CONSTATE" =~ "включено" ]]; then
	TOGGLE="Disable WiFi 睊"
elif [[ "$CONSTATE" =~ "отключено" ]]; then
	TOGGLE="Enable WiFi 直"
fi

# display menu; store user choice
CHENTRY=$(echo -e "$TOGGLE\n$LIST" | uniq -u | rofi -dmenu -p " WiFi SSID " -selected-row 1)
# store selected SSID
CHSSID=$(echo "${CHENTRY:3}" | xargs)

if [ "$CHENTRY" = "" ]; then
    exit
elif [ "$CHENTRY" = "Enable WiFi 直" ]; then
	nmcli radio wifi on
elif [ "$CHENTRY" = "Disable WiFi 睊" ]; then
	nmcli radio wifi off
else
	
	# If the connection is already in use, then this will still be able to get the SSID
	if [ "$CHSSID" = "*" ]; then
		CHSSID=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $3}')
	fi

	# Parses the list of preconfigured connections to see if it already contains the chosen SSID. This speeds up the connection process
if [[ "$CHENTRY" =~ "" ]]; then
	nmcli dev wifi con "$CHSSID"
else
WIFIPASS=$(echo " Press Enter if network is saved" | rofi -dmenu -p " WiFi Password: " -lines 1 )
		if [[ "$WIFIPASS" = " Press Enter if network is saved" ]]; then
			nmcli con up "$CHSSID"
	else
		nmcli dev wifi con "$CHSSID" password "$WIFIPASS"
	fi
		fi
fi

