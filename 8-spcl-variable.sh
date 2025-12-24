#!/bin/bash

echo " All variables passed to the script: $@"
echo " All variables passed to the script: $*"
echo " Script name: $0"
echo " what is the current working directory: $PWD"
echo " who is running this script: $USER"
echo " what is the home directory of the user running this script: $HOME"
echo " PID of the script: $$"
# useful to chekc the PID of the script
sleep 50 &
echo " PID of the las command run in the background: $!" 
# useful to chekc the PID of the last command run in the background
