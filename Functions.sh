#!/bin/bash

USERID=$(id -u)
if [ $? -ne 0 ]
then
    echo "ERROR:You are not running with root access"
    exit 1
else
    echo "You are running with ROOT access"
fi

VERIFY(){
    if [ $1 -eq 0 ]
    then 
        echo "Installing $2 is ..SUCCESS"
    else
        echo "Installing $2 is ..FAILURE"
    fi
}


dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed.. going to install it"
    dnf install mysql -y
    VERIFY $? mysql
else
    echo "mysql is already installed.. nothing to do it"
fi 

dnf list installed python
if [ $? -ne 0 ]
then 
    echo "python is not installed.. going to install it"
    dnf install python -y
    VERIFY $? python
else
    echo "python is already installed.. nothing to do it"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "nginx is not installed.. going to install it"
    dnf install nginx -y
    VERIFY $? nginx
else 
    echo "nginx is already installed.. nothing to do it"
fi
