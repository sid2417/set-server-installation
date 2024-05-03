#!/bin/bash/

# color 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
# Timestamp 
TIME_STAMP=$(date +%F-%H-%M-%S)
#SrciptName
SRCIPT_NAME=$(echo "$0" | cut -d "." -%f1)
# logFile
LOG_FILE=/tmp/$SRCIPT_NAME+$TIME_STAMP.log

echo "Please Enter Your mysql root password : "
read DB_Password

# UserId # 
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]
then 
    echo -e "$R Please Provide SUDO ACCESS....$N"
else
    echo -e "$G You Already Sudo User $N"
fi

VALIDATE()
{
    if [ $? -ne 0 ]
    then 
        echo -e "$R FAILED $N"
    else
         echo -e "$G SUCCESS $N"
    fi 
}

dnf install mysql-server -y &>>$LOG_FILE
VALIDATE $? "Your mysql-server Installation is :: " 

systemctl enable mysqld &>>$LOG_FILE
VALIDATE $? "Your mysql-server Enablind is :: " 

systemctl start mysqld &>>$LOG_FILE
VALIDATE $? "Your mysql-server Starting is :: " 

mysql_secure_installation --set-root-pass -p$(DB_Password) &>>$LOG_FILE
VALIDATE $? "Your mysql-server set up password is :: " 

echo -e "$Y Mysql Installation is going G O O D...$N"