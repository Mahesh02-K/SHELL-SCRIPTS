#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR : PLEASE RUN WITH ROOT ACCESS"
    exit 1
else
    echo "You are running with ROOT ACCESS"
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed.. going to install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Installing mysql is SUCCESS..."
    else 
        echo "Installing mysql is FAILURE..."
        exit 1
    fi
else
    echo "mysql is already installed.. Nothing to do"
fi

# $? is exit code of previous command in script,it is SUCCESS if it's 0,Failure other than 0
# for installing packages need to run the script with root access only,that's y we are checking first its running with root or not USERID=$(id -u)
# Before instaling any packages, we need to check if its already installed or not, so we wrote if condition for dnf list installed mysql
