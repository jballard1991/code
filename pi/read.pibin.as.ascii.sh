#!/bin/bash
#read file containing binary represented as ascii 0 and 1, convert to ascii, read with xxd, iterate every 5 seconds
while true ; do cat file| sed 's/[2-9]//g' | perl -lpe '$_=pack"B*",$_' | xxd -c 48 ; echo "[*] ==> reading again... " ; sleep 5; done
