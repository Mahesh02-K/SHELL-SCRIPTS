#!/bin/bash

echo "number of variables passed to script : $#"
echo "all variables passed to script : $@"
echo "Current directory : $PWD"
echo "home directory of user : $HOME"
echo "PID of the script : $$"
echo "PID of last command running in background : $!"
sleep 10 &
echo "Script name : $0"