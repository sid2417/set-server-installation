#!/bin/bash/
set -e

handle_error(){
    echo "Error occured at line number: $1, error command: $2"
}

trap 'handle_error ${LINENO} "$BASH_COMMAND"' ERR

# color 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
# Timestamp 
TIME_STAMP=$(date +%F-%H-%M-%S)
#SrciptName
SRCIPT_NAME=$(echo "$0" | cut -d "." -f1)
# logFile
LOG_FILE=/tmp/$SRCIPT_NAME+$TIME_STAMP.log

# UserId # 
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]
then 
    echo -e "$R Please Provide SUDO ACCESS....$N"
else
    echo -e "$G You Already Sudo User $N"
fi

echo "Please Enter Your mysql root password : "
read DB_Password
#read -s DB_Password



dnf install mysql-server -y &>>$LOG_FILE

systemctl enable mysqld &>>$LOG_FILE


systemctl start mysqlddd &>>$LOG_FILE


#mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOG_FILE
#mysql_secure_installation --set-root-pass -p$(DB_Password) &>>$LOG_FILE
#VALIDATE $? "Your mysql-server set up password is :: " 

#Below code will be useful for idempotent nature
# mysql -h db.happywithyogamoney.fun -uroot -pExpenseApp@1 -e 'show databases;' &>>$LOG_FILE
mysql -h db.happywithyogamoney.fun -uroot -p${DB_Password} -e 'show databases;' &>>$LOG_FILE
if [ $? -ne 0 ]
then 
   # mysql_secure_installation --set-root-pass ${DB_Password} &>>$LOG_FILE
   mysql_secure_installation --set-root-pass ${DB_Password} &>>$LOG_FILE
    #mysql_secure_installation --set-root-pass ExpenseApp@1
    
else 
    echo -e "$G You Already setup the Password for mySQL..so, we are skipping now .... $N"
fi

echo -e "$Y Mysql Installation is going G O O D...$N"
