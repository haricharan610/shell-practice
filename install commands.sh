#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR :: please run with this root access"

else

echo "you are runninh with root access"

fi

dnf list installed mongodb

#check if installed or not. if installed $? is 0, then
#if not installed $? is not 0. expression is true

if [ $? -ne 0 ]
then
echo " mongodb not installed... going to install it"
dnf install mongodb-org -y 
if [ $? -eq 0]
then
echo " installing mongodb... success"
else
echo "installing mongodb... fail"
fi

echo " mongodb already installed... nothing to do"

fi