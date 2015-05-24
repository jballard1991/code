#!/bin/bash
while true; do links -dump 4chan.org/b/|grep -Ev '___| / |IFrame|Start a New|Bottom Cata|Advertise|Dt Setting|Link: can|4chan Pass|Login|Please read the Rul|Yotsuba|Futaba|Burichan|Photon|Delete Post:|Show All'|sed 's/art/aut/g'|baud -900; done
