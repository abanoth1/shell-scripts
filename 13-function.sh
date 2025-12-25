#!/bin/bash

# installing the packages by using the shell script by validating the installation with the help of functions

USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
    echo "Error: Please run this script as root user or using sudo."
    exit 1 # failure is indicated by non-zero exit status
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo " Error: $2 installation failed."
        exit 1
    else
        echo " $2 installation completed successfully."

        # HERE $1 is the exit status of the last executed command
        # and $2 is the name of the package
    fi
}
dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "Python3"

# installation of multiple packages can be done by using functions by validating the installation of each package