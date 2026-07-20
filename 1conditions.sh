#!/bin/bash

userid=$(id -u)

if [ userid -ne o ]

then

echo "ERROR :: please run with root access"
exit1

then

echo "you running with root access"

fi

dnf list installed nginx

if [ $? -ne 0 ]

then

echo "nginx not installed... going to install it"

dnf install nginx -y

if [ $? -eq 0 ]

then

echo "installing nginx... success"

else 

echo "installing nginx... fail"
exit 1

fi

else 

echo "nginx already installed... noting to do"

fi