#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" # /var/log/shell-script/10-logs.sh.log
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# echo "I am continuing...."

VALIDATE(){
    if [ $2 -ne 0 ];then
        echo "$TIMESTAMP [ERROR] Installing $1 is .....FAILED" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$TIMESTAMP [SUCCESS] Installing $1 is .....SUCCESS" | tee -a $LOGS_FILE
    fi
}

for package in $@
do 
    echo "$TIMESTAMP [INFO] Installing $package" | tee -a $LOGS_FILE
    dnf list installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else 
        echo "$TIMESTAMP [INFO] $package already installed....SKIPPING" | tee -a $LOGS_FILE
    fi 
done