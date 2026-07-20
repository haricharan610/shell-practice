#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
  then
echo "ERROR :: please run eith this acces with root"
  exit 1 #give other than 0 upto 127

  else
 echo "you are running with root access"

fi

dnf list installed mysql
# check already installed or not. if installed $? is 0, then 
# if not installed $? is not 0 expression is true 

if [ $? -ne 0 ]
then 

echo " MYSQl is not installed... going to install it"
dnf install mysql -y
if [ $? eq -0 ]
else
echo " installing mysql.. success"
else
echo " mysql installing... fail"
fi

else 

echo "if mysql installed... nothing to do "

fi