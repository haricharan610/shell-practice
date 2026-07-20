#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then

echo "ERROR :: please run with root user"
exit 1

else

echo " running with root user"

fi

dnf list installed tree 

#check if already installed or not. if installed $? 0,
#if not installed $? is not 0.

if [ $? -ne 0 ]
then
echo "tree is not installed... going to install"
dnf install tree -y

if [ $? -eq 0 ]
then
    echo "Tree installing... SUCCESS"
else
    echo "Tree installing... FAILED"
    exit 1
fi

if [ $? -ne 0 ]

else
    echo "Tree is already installed... Nothing to do"
fi