#!/bin/bash 
# WORKING WITH COLORS IN SHELL SCRIPTING AND ADDING COLORS TO OUTPUT  AND ALSO USING FUNCTIONS AND LOOPS

set -e   # exit immediately if any command exits with a non-zero status

# error() {
#   echo " There was an error on $LINENO at command: $BASH_COMMAND " # print the line number and command that caused the error
# }

trap 'echo "There is an error in $LINENO, Command is: $BASH_COMMAND"' ERR # trap errors and call the error function

echo "Hello .." 
echo " Before the error..."
ccaffj1;dnf
echo " After the error..."