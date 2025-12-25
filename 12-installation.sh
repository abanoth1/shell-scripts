#!/bin/bash
# working on installation script in shell script

USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
    echo "Error: Please run this script as root user or using sudo."
    exit 1 # failure is indicated by non-zero exit status

fi
# Here the shell script is executed even though the user is not root
# because there is no exit command after the error message.
# To fix this, we can add an exit command after the error message.

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo " Error: MySQL installation failed."
    exit 1
else
    echo " MySQL installation completed successfully."
fi