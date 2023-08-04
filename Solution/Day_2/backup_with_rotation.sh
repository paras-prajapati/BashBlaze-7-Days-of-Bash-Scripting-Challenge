#!/bin/bash

# Check if a directory path is provided as a commandline argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 /path/to/source_directory"
    exit 1
fi

# Input directory path
source_directory=$1

# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
    echo "Error: Please provide a valid directory path as a command-line argument."
    exit 1
fi

# Create timestamp for backup folder
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
backup_folder="${source_directory}_backup_${timestamp}"

# Create the backup folder
if [ ! -d $backup_folder ]; then
  mkdir -p $backup_folder
fi

# Copy files from the source directory to the backup directory
cp -r "$source_directory"/* "$backup_folder"

# Rotation mechanism - keeping only the last 3 backups
backup_count=$(ls -d "${source_directory}_backup_"* 2>/dev/null | wc -l)
if [ $backup_count -gt 3 ]; then
    # Sort backup folders by their timestamps, oldest first
    sorted_backups=$(ls -d "${source_directory}_backup_"* | sort)

    # Determine the number of backups to delete
    backups_to_delete=$((backup_count - 3))

    # Remove the oldest backup folders
    for ((i = 1; i <= backups_to_delete; i++)); do
        backup_to_remove=$(echo "$sorted_backups" | head -n 1)
        rm -rf "$backup_to_remove"
        sorted_backups=$(echo "$sorted_backups" | tail -n +2)
    done
fi

echo "Backup created:$backup_folder"
