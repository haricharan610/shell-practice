#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logs_folder="/var/log/shellscript-logs"
script_name=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$script_name.log"
packages=("mysql" "python3" "nginx" "httpd")

mkdir -p $logs_folder
echo "script started executing at: $(date)" | tee -a $log_file

if [ $userid -ne 0 ]
then
echo -e "$R ERROR :: please run with root access $N" | tee -a $log_file
exit 1
else
echo "already running with root access"
fi

# validate functions takes input as exit status, what command they tried to install

validate(){
if [ $1 -eq 0 ]
then
echo -e "$G installing $2 ... success $N" | tee -a $log_file
else
echo -e "$R installing $2 ... fail $N" | tee -a $log_file
exit 1
fi
}

for package in ${packages[@]}
#for package in $@
do
pacman list installed $package &>>$log_file
if [ $? -ne 0 ]
then
 echo "$package not installed going to install" | tee -a $log_file
 dnf install $package -y &>>$log_file
 validate $? "$package"
 else
echo -e "Nothing to do $package... $Y already installed $N" | tee -a $log_file
 fi
 done
