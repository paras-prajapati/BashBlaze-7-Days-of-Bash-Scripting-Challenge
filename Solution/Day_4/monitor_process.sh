#!/bin/bash

# Function to check if a process is running
is_process_running() {
    pgrep -x "$process_name" > /dev/null 2>&1
}

# Function to restart the process
restart_process() {
    
    echo "Process $process_name is not running. Attempting to restart..."

    # Check if the user has the privilege to restart the process
    if sudo systemctl restart "$process_name"; then   # start process
        echo "Process $process_name restarted successfully."
    else
        echo "Failed to restart $process_name. Please check the process manually."
    fi
}
# Check if a process path is provided as a command-line argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 /path/to/your/process"
    exit 1
fi

process_name="$1" # Input process path
max_attempts=3
attempts=1

# Loop to check and restart the process
while [ $attempts -le $max_attempts ]; do
    if is_process_running "$process_name"; then
        echo "Process $process_name is running."
    else
        restart_process "$process_name"
    fi

     ((attempts++))
    sleep 5 # Adjust the interval as needed
done

echo "Maximum restart attempts reached. Please check the process manually."

