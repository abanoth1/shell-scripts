#!bin/bash
# working on EVEN and ODD number conditions
# A number is even if it is divisible by 2, else it is odd.

echo "Please enter a number:"
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "The given number $NUMBER is EVEN."
else
    echo "The given number $NUMBER is ODD."
fi