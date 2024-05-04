#!/bin/bash

echo "This is current script"
VARIABLE="current--script"
echo $VARIABLE
echo "now current script is running..."
echo "this is current script: $$"
echo "this is current script: $0"

./other.sh

echo "This is current script"
VARIABLE="current--script"
echo $VARIABLE
echo "now current script is running..."