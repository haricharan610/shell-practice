#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then

echo "ERROR :: please run with root user"

else

echo " running with root user"
exit 1
fi

dnf list installed catalouge 

#check if already installed or not. if installed $? 0,
#if not installed $? is not 0.

if [ $? -ne 0 ]
then
echo "catalouge is not installed... going to install"
dnf install cataluge -y

if [ $? -ne 0 ]
then

echo "catalouge installing... succes"
else

echo "catalouge installing... fail"
exit 1

fi

echo "catalouge already installed... nothing to do"
fi 