#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]

then

echo "please run with root access"

exit 1 

else

echo "you are running with root user"

fi

dnf list installed nginx 

#check if any installed or not 
#if installed $? is 0
#if not installed $? is not 0

if [ $? -ne 0 ]

then 

echo "nginx not installed... going to install"

dnf install nginx -y

if [ $? -eq 0 ]

then

echo "nginx installing... sucess"

else 

echo "nginx installing... fail"

exit 1

fi

echo "nginx already installed... nothing to do"

fi