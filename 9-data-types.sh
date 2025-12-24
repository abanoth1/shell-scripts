#!/bin/bash

# EVERY THING INSIDE THE SHELL SCRIPT IS CONSIDER AS A STRING UNTIL YOU DECLARE IT AS A VARIABLE

NUMBER1=100
NUMBER2=200

SUM=$(($NUMBER1+$NUMBER2))

echo "SUM is : ${SUM}"

# ARRAY IN BASH SCRIPT
# SYNTAX : ARRAY_NAME=(VALUE1 VALUE2 VALUE3)
# Size of the array = 4, index starts from 0 i,e 3

LEADERS=("Rahul" "Sachin" "Dhoni" "Kohli")

echo "All the leaders are : ${LEADERS[@]}"
echo "First Leader is : ${LEADERS[0]}"
echo "Second Leader is : ${LEADERS[1]}"