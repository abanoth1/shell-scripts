#!/bin/bash
# THIS SCRIPT MONITORS THE CPU USAGE OF THE SYSTEM AND LOGS THE USAGE TO A LOG FILE
# IT CAN BE SCHEDULED TO RUN PERIODICALLY USING CRON JOBS TO AUTOMATE THE MONITORING PROCESS

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 # Set threshold percentage for disk usage alert
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4) 
# Here we are getting the local IP address of the machine from the metadata service
# -s is used to make curl silent

MESSAGE=""
while IFS= read -r line; 

do
#   echo " Line: $line" # printing each line
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f 1) # extracting the usage percentage
    PARTITION=$(echo $line | awk '{print $7}') # extracting the partition name
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S') # getting the current timestamp
    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        MESSAGE+="High disk usage on $PARTITION: $USAGE% at $TIMESTAMP \n" # + is used to append the message
    # Here you can add code to send an alert email or notification
    fi

done <<< "$DISK_USAGE"

echo -e "Message Body: $MESSAGE"