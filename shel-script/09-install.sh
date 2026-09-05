#!/bin/bash

USERID=$(id -u)

# check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# echo "I am continuing...."
dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "MYSQL is already Installed ... SKIPPING"
else
    echo "Installing MySQL"
    dnf install mysql -y

    if [ $? -ne 0 ];then
        echo "Installing MySQL is .....FAILED"
        exit 1
    else
        echo "Installing MySQL is .....SUCCESS"
    fi
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "NGINX is already Installed ... SKIPPING"
else
    echo "Installing NGINX"
    dnf install nginx -y

    if [ $? -ne 0 ];then
        echo "Installing NGINX is .....FAILED"
        exit 1
    else
        echo "Installing NGINX is .....SUCCESS"
    fi
fi