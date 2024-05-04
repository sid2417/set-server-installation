#!/bin/bash


echo "this is other script"
VARIABLE="OTHER--script"
echo $VARIABLE

echo "this is other script: $$"
echo "this is other script: $0"

echo "Printing Everything : $@"
echo "Number of arguments you are passing : $#"
echo "This is current working directory : $PWD"
echo "Which user is using this : $USER"
echo "Current server name : $HOSTNAME"
echo "This is home directory : $HOME"
echo "This is current file name : $0"
echo "This is showing process id of current shell script program (PID): $$"