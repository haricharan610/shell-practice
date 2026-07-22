#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $  LOGS_FOLDER
echo "script started excueting at: $(date)" | tee -a $LOG_FILE

if [ $userid -ne 0 ]
then
echo -e "$R ERROR :: please run with root access $N" | tee -a $LOG_FILE 
exit 1 
else
echo "you are running with root access"
fi

validate(){

if [ $1 -eq 0 ]
then
echo -e "installing $2 success" | tee -a $LOG_FILE
else
echo -e "installing $2 fail" | tee -a $LOG_FILE
exit 1
fi
}
dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
echo "mysql not installed going to install it" | tee -a $LOG_FILE
dnf install mysql -y 
validate $? "mysql"
else
echo -e "$G mysql already installed nothing to do $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
echo "nginx not installed going to install it" | tee -a $LOG_FILE
dnf install nginx -y 
validate $? "nginx"

else
echo "nginx already installed nothing to do" | tree -a $LOG_FILE
fi
