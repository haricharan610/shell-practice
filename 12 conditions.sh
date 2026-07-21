#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then

echo "ERROR :: please run with root access"
exit 1

else
echo "you are running with root access"
fi

validate(){
    if [ $1 -eq 0 ]
then

echo "installing $2... success"
else

echo "installing $2... fail"
exit 1

fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then

echo "mysql not installed going to instal it"
dfn install mysql -y
validate $? "mysql"

else

echo "mysql already installed nothing to do"

fi

dnf list installed python3

if [ $? -ne 0 ]
then

echo "python3 not installed going to install it"
dnf install python3 -y
validate $? "python"

else

echo "ptyhon3 already installed nothing to do"
fi

dnf list installed nginx 

if [ $? -ne 0 ]
then

echo "nginx not installed going to install it"
dnf install nginx -y 
validate $? "nginx"

else

echo "nginx already installed nothing to do"
fi