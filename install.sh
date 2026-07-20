#!/bin/bash

userid=$( userid -ne 0 )

if [ $userid -ne 0 ]
then
exit 1

echo "ERROR :: please run with root user"

else

echo " running with root user"
fi

dnf list installed cataluge 

#check if already installed or not. if installed $? 0,
#if not installed $? is not 0.

if [ $? -eq 0 ]
then
echo "catalouge is not installed... going to install"
dnf install cataluge -y

if [$? -eq 0 ]
then

echo "catalouge installing... succes"
else

echo "catalouge installing... fail"
fi

echo "catalouge installing... nothing to do"