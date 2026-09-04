#!/bin/bash

### Special Vars ######
echo "All variables passed into script: $@"
echo "Number of variables passed: $#"
echo "First variable: $1"
echo "Script name: $0"
echo "Who is running this : $USER"
echo "which directory am in: $PWD"
echo "present user Home Directory: $HOME"
echo "PID for current script: $$"
sleep 5 &
echo "PID of the background command running just now: $!"
wait $!
echo "Line Number: $LINENO"