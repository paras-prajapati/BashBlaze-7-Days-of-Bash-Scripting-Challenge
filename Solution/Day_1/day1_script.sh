#!/bin/bash

echo -e "Task 1: Comments  (#)Sign"
# Comment define by (#)Sign
# This script demonstrates various tasks in bash scripting.


# Task 2: Echo
echo
echo -e "Task 2: Using the echo command to display a message on the terminal."

echo
# Task 3: Variables
# Declare variables and assign values
name="paras"
age=26
echo "Task 3: The Declar variable is $name and $age."

echo 

echo -e "Task 4: Using Variables"
# Take two numbers as input and print their sum
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2
sum=$((num1 + num2))
echo "Sum of $num1 and $num2 is: $sum"

echo 

echo -e "Task 5: Using Built-in Variables"
echo "My current bash path - $BASH"
echo "Bash version I am using - $BASH_VERSION"
echo "PID of bash I am running - $$"
echo "My home directory - $HOME"
echo "Where am I currently? - $PWD"
echo "My hostname - $HOSTNAME"

echo

echo -e "Task 6: Wildcards"
echo "Files with .txt extension in the current directory:"
ls *.txt
