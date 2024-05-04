#!/bin/bash

COURSE="DevOps from Current Script"

echo "Before calling other script, course: $COURSE"
echo "Process ID of current shell script: $$"

source ./other.sh

#source ./16-other-script.sh

echo "After calling other script, course: $COURSE"



