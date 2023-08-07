#!/bin/bash

# Function to read and display the menu from menu.txt file
function display_menu() {
    echo "Welcome to the Restaurant!"
    echo "Menu:"
    while read -r line; do
        item_number=$(echo "$line" | cut -d ',' -f 1)
        item_name=$(echo "$line" | cut -d ',' -f 2)
        item_price=$(echo "$line" | cut -d ',' -f 3)
        echo "$item_number. $item_name - ₹$item_price"
    done < menu.txt
}

# Function to calculate the total bill
function calculate_total_bill() {
    local total=0
    for item_number in "${!order[@]}"; do
        item_quantity=${order[$item_number]}
        item_price=$(grep "^$item_number," menu.txt | cut -d ',' -f 3)
        total=$((total + item_quantity * item_price))
    done
    echo "$total"
}

# Function to handle invalid user input
function handle_invalid_input() {
    echo "Invalid input! Please enter a valid item number and quantity."
}

# Main script
display_menu

# Ask for the customer's name
echo -n "Please enter your name: "
read customer_name

# Ask for the order
echo "Please enter the item number and quantity (e.g., 1 2 for two Burgers):"
read -a input_order

# Process the customer's order
declare -A order
for ((i = 0; i < ${#input_order[@]}; i += 2)); do
    item_number="${input_order[i]}"
    quantity="${input_order[i + 1]}"
    if [[ $item_number =~ ^[0-9]+$ && $quantity =~ ^[0-9]+$ ]]; then
        order["$item_number"]="$quantity"
    else
        handle_invalid_input
        exit 1
    fi
done

# Calculate the total bill
total_bill=$(calculate_total_bill)

# Display the total bill with a personalized thank-you message
echo "Thank you, $customer_name! Your total bill is ₹$total_bill."

