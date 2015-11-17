#!/bin/bash          
#

echo "Hello World - WLC client scan" 
echo "timestamp,ip,ltap_p,lt_open,total"

	baseip="192.168.193.0"
#	echo $baseip
	stub="192.168.193"
#	echo $stub
	timestamp=`date +%d-%m-%y\ %R`
#	echo "time" $timestamp
	ltap_p_total=0
	lt_open_total=0

	for octet in {90..93}
	do
   		ip=$stub.$octet
#		echo Trying $timestamp $ip

# This bit nicked from Stuart's TFTPGET script
		if ping -c 1 -t 1 -o $ip 2>&1 >/dev/null ; then
#			echo Woohoo, got a response from $ip
#			echo "Trying ssh on $ip"
			ltap_p=0	
			lt_open=0
			client=`./getcisco.sh $ip | grep WLAN`
			if [[ $client == *WLAN* ]] ; then
#				echo "It's a WLC"
#				echo $client
				
				ltap_p=`echo $client | tr -d "\r" | cut -d\  -f6`
				lt_open=`echo $client | tr -d "\r" | cut -d\  -f12`
				total=$(($lt_open + $ltap_p))	

#				echo ==== $ltap_p ====
#				echo ==== $lt_open ====
#				echo ==== $total ====
#				echo ==== $serial ====
			fi
			ltap_p_total=$((ltap_p_total + ltap_p))
			lt_open_total=$((lt_open_total + lt_open))
			echo $timestamp,$ip,$ltap_p,$lt_open,$total
		fi

	done

	grand_total=$((ltap_p_total + lt_open_total))
	echo $timestamp,All,$ltap_p_total,$lt_open_total,$grand_total


