#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR : PLEASE RUN WITH ROOT ACCESS"
    exit 1
else
    echo "You are running with ROOT ACCESS"
fi
dnf list installed MySQL
if [ $? -ne 0 ]
then
    echo "MySQL is not installed.. going to install it"
    dnf install MySQL -y
    if [ $? -eq 0 ]
    then
        echo "Installing MySQL is SUCCESS..."
    else 
        echo "Installing MySQL is FAILURE..."
        exit 1
    fi
else
    echo "MySQL is already installed.. Nothing to do"
fi
