#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]

then

echo "ERROR :: please use root access"

exit 1

else

echo "you are running with root access"

fi

checkstatus(){

   if [ $1 -eq 0 ]
 
 then

 echo "installing $2... is success"

 else

 echo "installing $2.. is fail"
exit 1

fi

}

dnf list installed mysql 

if [ $? -ne 0 ]
then

echo "mysql is not installed... going to install it"

dnf install mysql -y

checkstatus $? "mysql"
else

echo "mysql already installed nothing to do"

fi

dnf list installed pyhon3

if [ $? -ne 0 ]
then

echo "pyhon3 is not installed... going to install it"

dnf install python3 -y

checkstatus $? "python3"
else

echo "python3 already installed... nothing to do"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then

echo "nginx not installed... going to install it"
dnf install nginx

checkstatus $? "nginx"
else

echo "nginx already installed nothing to do"
fi