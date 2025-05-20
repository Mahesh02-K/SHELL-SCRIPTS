#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
M="\e[35m"
B="\e[34m"
N="\e[0m"

if [ "$USERID" -ne 0 ]
then
    echo -e " $G ERROR:You are not running with root access $N "
    exit 1
else
    echo -e " $R You are running with ROOT access $N "
fi

VERIFY(){
    if [ $1 -eq 0 ]
    then 
        echo -e "Installing $2 is .. $R SUCCESS $N "
    else
        echo -e "Installing $2 is .. $G FAILURE $N "
    fi
}
# VERIFY is a function that takes input as exit status and what command they try to install


dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo -e " $M mysql is not installed.. going to install it $N "
    dnf install mysql -y
    VERIFY $? mysql
else
    echo -e " $B mysql is already installed.. nothing to do it $N "
fi 

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo -e " $M python3 is not installed.. going to install it $N "
    dnf install python3 -y
    VERIFY $? python3
else
    echo -e " $B python3 is already installed.. nothing to do it $N "
fi
dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo -e " $M nginx is not installed.. going to install it $N "
    dnf install nginx -y
    VERIFY $? nginx
else 
    echo -e " $B nginx is already installed.. nothing to do it $N "
fi
