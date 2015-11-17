#!/bin/bash          
#

echo "Runs continuously. Clunky but so what?"

while :
do
	echo "Press [CTRL+C] to stop.."
	./wlcscan.sh
	sleep 794
#	wlcscan takes approx 1:46 to run, 794 secs should make it 15 min cycles
done
