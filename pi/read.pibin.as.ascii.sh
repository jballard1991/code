#!/bin/bash
#read file containing binary represented as ascii 0 and 1, convert to ascii, read with xxd, iterate every 15 seconds
while true ; do echo "[*] ==> reading "; cat file| sed 's/[2-9]//g' | perl -lpe '$_=pack"B*",$_' | xxd -c 48 ; echo -n "pi digits: "; cat file|wc -c;echo -n "pibin digits: ";cat file | sed 's/[2-9]//g' | wc -c;sleep 15; done
