#!/bin/bash

# Input
# Check if a log-file path is provided as a command-line argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 /path/to/source_directory"
    exit 1
fi

log_file="$1" # Input logfile path

# Check if the log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Please provide a valid logfile path as a command-line argument. $log_file"
    exit 1
fi

# Summary Report

date_of_analysis=$(date '+%Y-%m-%d_%H-%M-%S') #Date of analysis

log_file_name=$(basename "$log_file") #Log file name

summary_file="summary_report_${log_file_name%.*}.txt"  #summary file

total_lines=$(wc -l < "$log_file") #Total lines processed

error_count=$(grep -c -i "ERROR\|Failed" "$log_file") #Error Count

critical_events=$(grep -n -i "CRITICAL" "$log_file") #Critical Events

top_errors=$(grep -i "ERROR\|Failed" "$log_file" | awk '{print $0}' | sort | uniq -c | sort -nr | head -n 5) #Top Error Messages

# Generate the summary report
echo "Date of analysis: $date_of_analysis" > "$summary_file"
echo "Log file name: $log_file_name" >> "$summary_file"
echo "Total lines processed: $total_lines" >> "$summary_file"
echo "Total error count: $error_count" >> "$summary_file"
echo -e "\nTop 5 error messages:" >> "$summary_file"
echo "$top_errors" >> "$summary_file"
echo -e "\nList of critical events with line numbers:" >> "$summary_file"
echo "$critical_events" >> "$summary_file"

echo "Analysis complete. Summary report saved to: $summary_file"

#Optional Enhancement save log file in that 
 designated_directory="archive"
 mkdir -p "$designated_directory"
 mv "$log_file" "$designated_directory/"

