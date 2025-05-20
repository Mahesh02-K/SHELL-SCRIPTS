#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
M="\e[35m"
B="\e[34m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("nginx" "mysql" "python3" "httpd")

mkdir -p $LOGS_FOLDER
echo "script started executing at : $(date)" | tee -a $LOG_FILE

if [ "$USERID" -ne 0 ]
then
    echo -e " $G ERROR:You are not running with root access $N " | tee -a $LOG_FILE
    exit 1
else
    echo -e " $R You are running with ROOT access $N " | tee -a $LOG_FILE
fi

VERIFY(){
    if [ $1 -eq 0 ]
    then 
        echo -e "Installing $2 is .. $R SUCCESS $N " | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is .. $G FAILURE $N " | tee -a $LOG_FILE
    fi
}
# VERIFY is a function that takes input as exit status and what command they try to install

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo -e " $M $package is not installed.. going to install it $N " | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VERIFY $? $package
    else
        echo -e " $B $package is already installed.. nothing to do it $N " | tee -a $LOG_FILE
    fi 
done

#  | tee -a $LOG_FILE this command will print the output onscreen and upload into logfile 
#  &>>$LOG_FILE this command will redirect the output into logfile
#  -e is used for enable the colors