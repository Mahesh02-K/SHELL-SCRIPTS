#!/bin/bash

START_TIME=$(date +%s)
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR=/home/ec2-user/application-logs

mkdir -p $LOGS_FOLDER

#check user has root priveleges or not
if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR :: PLEASE RUN WITH ROOT $N"
    exit 1
else
    echo -e "$G You are running with ROOT $N"
fi

#verify function takes input as exit status and what command they try to install
VERIFY(){
    if [ $1 -eq 0 ]
    then 
        echo -e "$2 is ... $R SUCCESS $N"
    else
        echo -e "$2 is ... $G FAILURE $N"
        exit 1
    fi
}

echo "Script Started executing at $(date)"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r filepath
do 
    echo "Deleting file: $filepath" 
    rm -rf $filepath
done <<< $FILES_TO_DELETE

echo "Script executed successfully"

