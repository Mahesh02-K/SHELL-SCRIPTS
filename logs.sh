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


dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo -e " $M mysql is not installed.. going to install it $N " | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VERIFY $? mysql
else
    echo -e " $B mysql is already installed.. nothing to do it $N " | tee -a $LOG_FILE
fi 

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo -e " $M python3 is not installed.. going to install it $N " | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VERIFY $? python3
else
    echo -e " $B python3 is already installed.. nothing to do it $N " | tee -a $LOG_FILE
fi
dnf list installed nginx &>>LOG_FILE
if [ $? -ne 0 ]
then 
    echo -e " $M nginx is not installed.. going to install it $N " | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VERIFY $? nginx
else 
    echo -e " $B nginx is already installed.. nothing to do it $N " | tee -a $LOG_FILE
fi
 
#  | tee -a $LOG_FILE this command will print the output onscreen and upload into logfile 
#  &>>$LOG_FILE this command will redirect the output into logfile
#  -e is used for enable the colors