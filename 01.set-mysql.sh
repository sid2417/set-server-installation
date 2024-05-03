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
# UserId # 
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]
then 
    echo "Please Provide SUDO ACCESS...."
else
    echo "You Already Sudo User"
fi

