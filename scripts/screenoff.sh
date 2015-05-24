#!/bin/bash
# Turns off the monitor on a linux machine every 6 seconds via power management
while [ 1 ];  do xset dpms force off; sleep 6; done
