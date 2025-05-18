#!/bin/bash

echo "number of variables passed to script : $#"
echo "all variables passed to script : $@"
echo "Current directory : $PWD"
echo "home directory of user : $HOME"
echo "PID of the script : $$"
sleep 10 &
echo "PID of last command running in background : $!"
echo "Script name : $0"