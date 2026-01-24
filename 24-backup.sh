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
#LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log
LOG_FILE="$LOGS_FOLDER/backup.log" # modified to run the script as command line with different arguments and log all the backups in single log file

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

# # FINDING FILES TO BACKUP
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

# In my backup script, I used find with -mtime +14, which only matches files older than 14 days.Since my files were new, the script found nothing. 
# I fixed it by changing to -mtime -14 to match files modified within the last 14 days, and now it works as expected.

 if [ ! -z "${FILES}" ]; then
# # STARTING THE BACKUP PROCESS
   echo "FILES FOUND TO BACKUP:$FILES"
     TIMESTAMP=$(date +%F-%H-%M-%S)
     ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
     echo "zipping the file name: $ZIP_FILE_NAME"
     find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME" # -j option to junk the path information

# # VERIFYING IF THE BACKUP WAS SUCCESSFUL
     if [ -f $ZIP_FILE_NAME ]
      then
         echo -e "$G BACKUP SUCCESSFULLY CREATED AT $ZIP_FILE_NAME $N"

    while IFS= read -r filepath # reading each file path line by line IFS is internal field separator
        do
            echo "Deleting the file: $filepath"
            rm -rf $filepath
            echo "Deleted the file: $filepath"
        done <<< $FILES  #here document to pass the variable as input to while loop

     else
         echo -e "$R BACKUP FAILED $N"
     fi

else
     echo -e "$G no files found to backup... $Y SKIPPING $N"
 fi

 ## My backup script finds specific files in a source directory, compresses them into a timestamped zip file, and stores that zip in a destination directory. 
 ## This way, the files are transferred in compressed form, and they can be unzipped later in the destination to restore or view them.
 ## Additionally, the script logs its actions and verifies the success of the backup process.