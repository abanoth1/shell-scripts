#!/bin/bash
# CREATED SEPARATE COMMON.SH FILE
# WORKING WITH WHILE LOOP IN SHELL SCRIPTING TO READ A FILE LINE BY LINE AND PRINT THE CONTENT OF THE FILE

count=5

echo "starting the coutndown"

while [ $count -gt 0 ]; 
    do
        echo "count: $count"
        sleep 1 # sleep for 1 second
        count=$((count - 1)) # decrement the count by 1
    done

    echo "countdown completed" # print message after countdown is completed