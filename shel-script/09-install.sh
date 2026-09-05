#!/bin/bash

USERID=$(id -u)

# check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# echo "I am continuing...."

VALIDATE(){
    if [ $2 -ne 0 ];then
        echo "Installing $1 is .....FAILED"
        exit 1
    else
        echo "Installing $1 is .....SUCCESS"
    fi
}

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "MYSQL is already Installed ... SKIPPING"
else
    echo "Installing MySQL"
    dnf install mysql -y
    VALIDATE MySQL $?
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "NGINX is already Installed ... SKIPPING"
else
    echo "Installing NGINX"
    dnf install nginx -y
    VALIDATE NGINX $?
fi