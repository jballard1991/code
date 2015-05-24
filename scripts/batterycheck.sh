#!/bin/bash
# This shell script reads from the sysfs vfs to measure battery energy levels
# TODO: C rewrite, calculate percentages, reformat data
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
