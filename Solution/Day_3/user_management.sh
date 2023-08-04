#!/bin/bash

# display usage information
display_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -c, --create     Create a new user account"
    echo "  -d, --delete     Delete an existing user account"
    echo "  -r, --reset      Reset the password of an existing user account"
    echo "  -l, --list       List all user accounts"
    echo "  -h, --help       Display this help message"
}

# create a new user account
create_account() {
    read -p "Enter new username: " new_username

    # Check if username already exists
    if id "$new_username" &>/dev/null; then
        echo "Error: Username '$new_username' already exists. Please choose a different username."
        exit 1
    fi
    sudo useradd -m -s /bin/bash "$new_username" &> /dev/null 
	read -s -p "Enter the password for '$new_username': " new_password
	echo "$new_username:$new_password" | sudo chpasswd
	echo "User account '$new_username' created successfully"

}

# delete an existing user account
delete_account() {
    read -p "Enter username to delete: " del_username

    # Check if username exists
    if ! id "$del_username" &>/dev/null; then
        echo "Error: Username '$del_username' does not exist.Please enter a valid username."
        exit 1
    fi

    sudo userdel -r "$del_username"
    echo "User account '$del_username' deleted successfully."
}

# Password reset user account
reset_password() {
        read -p "Enter the username to reset the password: " reset_username
           # Check if username exists
	if ! id $reset_username &> /dev/null; then
	     echo "Error: Username '$reset_username' does not exist."
	     exit 1 
	fi
	read -sp "Enter the new password for '$reset_username': " new_password
	echo "$reset_username:$new_password" | sudo chpasswd
	echo " Password reset successfully for '$reset_username'"
	echo "Password for user '$reset_username' reset successfully."
}

# list all user accounts and their details
list_accounts() {
    echo "User accounts and details:"
    cat /etc/passwd | awk -F: '{ print "- " $1 " (UID: " $3 ")" }'
    
    # Displaying more detailed information about user accounts (e.g., home directory, shell, etc.).
    #cat /etc/passwd | awk -F: '{print "-" "Username: " $1, "UID: " $3, "Home: " $6, "Shell: " $7}'
}

# script execution

if [ $# -eq 0 ]; then
    display_usage
    exit 1
fi

case "$1" in
    -c|--create)
        create_account
        ;;
    -d|--delete)
        delete_account
        ;;
    -r|--reset)
        reset_password
        ;;
    -l|--list)
        list_accounts
        ;;
    -h|--help)
        display_usage
        ;;
     *)
        echo "Invalid option: $1"
        display_usage
        exit 1
        ;;
   esac

exit 0

