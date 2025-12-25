#!/bin/bash

# working on the conditions in shell script

NUMBER=$1

if [ "$NUMBER" -lt 10 ]; then   # -lt is less than operator
    echo "The given $NUMBER is less than 10."
else
    echo "The number $NUMBER is greater than or equal to 10."
fi