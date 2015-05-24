#!/bin/bash
while true; 
	do 
                echo "+-------------------+";
		sleep 1;
		echo -n "energy_full: ";
		cat /sys/class/power_supply/BAT0/energy_full;
		echo -n "energy_now:  ";
		cat /sys/class/power_supply/BAT0/energy_now; 
		echo -n "power_now:   ";
		cat /sys/class/power_supply/BAT0/power_now;
done
