#!/bin/bash
# working on installation script in shell script

USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
    echo "Error: Please run this script as root user or using sudo."

fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo " Error: MySQL installation failed."
else
    echo " MySQL installation completed successfully."
fi