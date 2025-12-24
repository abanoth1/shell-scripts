#!/bin/bash

#DATE=$(date +%s)
# DATE=$(date +%s) is used in Linux shell scripting to execute the date command and assign its output to the variable DATE

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)
 TOTA_TIME=$(($END_TIME - $START_TIME))
 
echo "Total time taken: $TOTAL_TIME seconds"