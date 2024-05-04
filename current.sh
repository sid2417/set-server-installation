#!/bin/bash

COURSE="DevOps from Current Script"

echo "Before calling other script, course: $COURSE"
echo "Process ID of current shell script: $$"

source ./other.sh

#source ./16-other-script.sh

echo "After calling other script, course: $COURSE"


Before calling other script, course: DevOps from Current Script
Process ID of current shell script: 4413
Variable value from Other script: DevOps from Other Script
Process ID of other script: 4414
After calling other script, course: DevOps from Current Script



Before calling other script, course: DevOps from Current Script
Process ID of current shell script: 4432
Variable value from Other script: DevOps from Other Script
Process ID of other script: 4432
After calling other script, course: DevOps from Other Script
