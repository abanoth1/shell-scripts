#!/bin/bash
# WORKING WITH COLORS IN SHELL SCRIPTING AND ADDING COLORS TO OUTPUT

R='\e[31m' # RED COLOR
G='\e[32m' # GREEN COLOR
Y='\e[33m' # YELLOW COLOR
B='\e[34m' # BLUE COLOR
M='\e[35m' # MAGENTA COLOR
C='\e[36m' # CYAN COLOR
W='\e[37m' # WHITE COLOR
N='\e[0m'  # NO COLOR


USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
    echo "Error: Please run this script as root user or using sudo."
    exit 1 # failure is indicated by non-zero exit status
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 .... $R failure $N"
        exit 1
    else
        echo -e "installing $2 .... $G success $N"

        # HERE $1 is the exit status of the last executed command
        # and $2 is the name of the package
        # addingn colors to the output
    fi
}
dnf install mysql -y
# install if the mysql is not installed
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "MySQL is already installed .... $Y skipped $N"
fi


dnf install nginx -y
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx is already installed .... $Y skipped $N"
fi


dnf install python3 -y
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo -e "Python3 is already installed .... $Y skipped $N"
fi


# installation of multiple packages can be done by using functions by validating the installation of each package
