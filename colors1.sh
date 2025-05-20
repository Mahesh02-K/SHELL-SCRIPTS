#!/bin/bash

USERID=$(id -u)

R=$("\e[31m")
G=$("\e[32m")
B=$("\e[34m")
M=$("\e[35m")
N=$("\e[0m")

if [ $USERID -ne 0 ]
then
    echo -e " $G ERROR : PLEASE RUN WITH ROOT ACCESS $N "
    exit 1
else
    echo -e " $M You are running with ROOT ACCESS $N "
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e " $B mysql is not installed.. going to install it $N "
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo -e " $R Installing mysql is SUCCESS... $N "
    else 
        echo -e " $G Installing mysql is FAILURE... $N "
        exit 1
    fi
else
    echo -e " $M mysql is already installed.. Nothing to do $N "
fi
