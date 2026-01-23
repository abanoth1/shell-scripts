#!/bin/bash
# HERE WE ARE CREATING A BACKUP OF IMPORTANT FILES AND DIRECTORIES USING TAR COMMAND AND STORING THE BACKUP IN A SPECIFIED BACKUP DIRECTORY WITH TIMESTAMP
# THIS SCRIPT CAN BE SCHEDULED TO RUN PERIODICALLY USING CRON JOBS TO AUTOMATE THE BACKUP PROCESS

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if not provided considered as 14 days

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log
#LOG_FILE="$LOGS_FOLDER/backup.log" # modified to run the script as

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh-24-backup.sh <SOURCE_DIR> <DESTINATION_DIR> <DAYS> [OPTIONAL: DAYS AFTER WHICH OLD BACKUPS WILL BE DELETED, DEFAULT IS 14 DAYS] $N"
    exit 1
}

# CHECKING THE ARGUMENTS PASSED OR NOT
if [ $# -lt 2 ]; then # checking number of arguments passed
    USAGE
fi

# # CHECKING IF SOURCE AND DESTINATION DIRECTORIES EXIST
 if [ ! -d $SOURCE_DIR ]; then # checking if source directory exists
     echo -e "$R SOURCE $SOURCE_DIR DOES NOT EXIST $N"
     exit 1
 fi

# CHECKING IF DESTINATION DIRECTORY EXISTS
if [ ! -d $DEST_DIR ]; then # checking if destination directory exists
    echo -e "$R DESTINATION $DEST_DIR DOES NOT EXIST $N"
    exit 1
fi

# # FINDING FILES TO BACKUP BASED ON MODIFICATION TIME
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

 if [ ! -z "${FILES}" ]; then
# # STARTING THE BACKUP PROCESS
   echo "FILES FOUND TO BACKUP:$FILES"
#     TIMESTAMP=$(date +%F-%H-%M-%S)
#     ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
#     echo "zipping the file name: $ZIP_FILE_NAME"
#     echo $FILES | zip -@ -j "$ZIP_FILE_NAME"

else
     echo  "$G no files found to backup... $Y SKIPPING $N"
 fi