#!/bin/bash

# Argumnets are extra information you give to your script from the terminal.
# Here we are passing the arguments to the script and storing them in variables rather than declaring them inside the script.

PERSON1=$1
PERSON2=$2

echo "Hello, $PERSON1! How are you today?"
echo "Hello, $PERSON2! How are you today?"
echo "$PERSON1 i'm doing great, thanks for asking."
echo "$PERSON2 i'm doing great, thanks for asking."
echo "$PERSON1  i am a software developer."
echo "$PERSON2  i am a devops engineer."
