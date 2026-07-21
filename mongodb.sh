#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then

echo "ERROR ::: please run with root access"
exit 1 

else
echo "you running with root access"
fi

dnf list installed mongodb-org -y 

if [ $? -ne 0 ]
then 

echo "mongodb not installed going to install it"
dnf install mongodb-org -y 

if [ $? -ne 0 ]
then
echo "mongodb install success"
else
echo "mongodb install fail"
fi

else 
echo "mongodb already install nothing to do"
fi
systemctl enable mongodb
systemctl start mongodb

sed -i 's/127/0.0.1/0.0.0.0/' /etc/mongod.conf

systemctl restart mongod

echo "mongodb configuration completed"
