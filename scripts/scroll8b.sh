#!/bin/bash
while true; do links -dump 8ch.net/b/|grep -v '\[ \] '|baud -1200; done
