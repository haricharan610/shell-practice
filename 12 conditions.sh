#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then

echo "ERROR :: please run with root access"
exit 1

else

echo "you are running with root access"
fi

checkstatus(){

if [ $1 -eq 0 ]
then

echo "installing $2... success"
else

echo "installing $2.... fail"
exit 1

fi
}

dnf list installed tree 

if [ $? -ne 0 ]
then

echo "tree not installed going to install it"
dnf install tree -y
checkstatus $? "tree"

else

echo "tree already installed nothing to do"
fi

dnf list installed git

if [ $? -ne 0 ]
then

echo "git not installed going to install it"
dnf install git -y
checkstatus $? "git"

else

echo "git already installed nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then

echo "nginx not installed going to install it"
dnf install nginx -y
checkstatus $? "nginx"

else
echo "nginx already installed nothing to do"
fi