#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" # /var/log/shell-script/10-logs.sh.log

# check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# echo "I am continuing...."

VALIDATE(){
    if [ $2 -ne 0 ];then
        echo "Installing $1 is .....FAILED" | tee -a $LOGS_FILE
        exit 1
    else
        echo "Installing $1 is .....SUCCESS" | tee -a $LOGS_FILE
    fi
}

dnf list installed mysql &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "MYSQL is already Installed ... SKIPPING"
else
    echo "Installing MySQL"
    dnf install mysql -y &>> $LOGS_FILE
    VALIDATE MySQL $?
fi

dnf list installed nginx &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "NGINX is already Installed ... SKIPPING"
else
    echo "Installing NGINX"
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE NGINX $?
fi