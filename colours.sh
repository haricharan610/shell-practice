#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]
then
echo "ERROR :: $R please use root access $N"
exit 1
else 
echo "$R you are already running with root access $N"
fi

checkstatsu(){
if [ $1 -eq 0 ]
then
echo "$G installing $2 success $N"
else
echo "$R installing $2 fail $N"
exit 1 
fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
echo "$Y mysql not installed going to install it $N"
dnf install mysql -y
checkstatus $? "mysql"
else
echo "$Y mysql already installed nothing to do $N"
fi

dnf list installed pyhton3

if [ $? -ne 0 ]
then
echo "$Y python3 not installed going to install it $N"
dnf install python3 -y
checkstatus $? "python3"
else
echo "$Y python3 already installed nothing to do $N"
fi 