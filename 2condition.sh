#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]

then

echo "please use root user"

exit 1

else

echo "you running with root user"

fi

dnf installed list mysql 

#check if already installed or not. if installed $? is 0
#if not installed $? not 0

if [ $? -ne 0 ]

then

echo "mysql not installed... going to install"

dnf install mysql

if [ $? -eq 0 ]

then

echo "mysql installing... success"

else

echo "mysql installing... fail"

exit 1

fi

else 

echo "mysql already installed... nothing to do"

fi

