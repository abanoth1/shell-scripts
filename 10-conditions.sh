
#!/bin/bash

# working on the conditions in shell script

NUMBER=$1

if [ "$NUMBER" -lt 10 ]; then   # -lt is less than operator
    #echo "The given number $NUMBER is less than 10."
    elif [ "$NUMBER" -eq 10 ]; then   # -eq is equal to operator
    echo "The given number $NUMBER is equal to 10."
    elif [ "$NUMBER" -gt 10 ]; then   # -gt is greater than operator
    echo "The given number $NUMBER is greater than 10."
    #elif [ "$NUMBER" -le 10 ]; then   # -le is less than or equal to operator
    #echo "The given number $NUMBER is less than or equal to 10."
    elif [ "$NUMBER" -ge 10 ]; then   # -ge is greater than or equal to operator
    echo "The given number $NUMBER is greater than or equal to 10."
    elif [ "$NUMBER" -ne 10 ]; then   # -ne is not equal to operator
    echo "The given number $NUMBER is not equal to 10."
else
    echo "The given number $NUMBER is greater than or equal to 10."
fi