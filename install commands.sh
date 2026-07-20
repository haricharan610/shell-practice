#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR :: please run with this root access"

else

echo "you are runninh with root access"

fi

dnf list installed nginx

#check if installed or not. if installed $? is 0, then
#if not installed $? is not 0. expression is true

if [ $? -ne 0 ]
then
echo " nginx not installed... going to install it"
dnf install nginx -y 
if [ $? -eq 0]
then
echo " installing nginx... success"
else
echo "installing nginx... fail"
fi

echo " nginx already installed... nothing to do"

fi