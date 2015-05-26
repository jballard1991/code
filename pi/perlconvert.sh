#!/bin/bash
#convert ascii bin into ascii
perl -lpe '$_=pack"B*",$_'
