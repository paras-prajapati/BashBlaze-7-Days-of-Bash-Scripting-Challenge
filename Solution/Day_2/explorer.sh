#!/bin/bash

echo
echo "Part 1: File and Directory Exploration"
echo

# Welcome message
echo "Welcome to the Interactive File and Directory Explorer!"

# to explore files and directories
while true; do
    echo "Files and Directories in the Current Path:"
    # List all files and directories in the current path with human-readable sizes
    ls -lh | awk 'NR > 1 {print "-" $9, "("$5")"}'
    read -p "Do you want to continue exploring? (y/n):" choice
    [[ "$choice" != "y" ]] && break
done

echo
echo "Part 2: Character Counting "
echo

# Prompt the user for input and count characters until an empty string is entered
while true; do
read -rp "Enter a line of text (Press Enter without text to exit): " line 
 # Check if the input line is empty
	if [ -z "$line" ]; then
	   echo "Exiting the Interactive Explorer. Goodbye!..."
	   break
	else
	   # Count the number of characters in the input line
	   char_count=$(echo -n $line | wc -c)
           echo "Character count: $char_count"
	fi
done
