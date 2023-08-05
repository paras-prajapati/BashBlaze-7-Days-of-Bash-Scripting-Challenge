
# Step 1: Input Check if a log-file path is provided as a command-line argument
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

#  Count the total number of lines 
total_lines=$(wc -l < "$log_file")

# Step 2: Error Count total error count (identified by the keyword "ERROR\|Failed") 
error_count=$(grep -c -i "ERROR\|Failed" "$log_file")

# Step 3: Critical Events Search for keyword "CRITICAL" and store them in an array
mapfile -t critical_events < <(grep -n -i "CRITICAL" "$log_file")

# Step 4: Top 5 Error Messages 
top_error=`cat $log_file | awk -F'] |- ' '{print $2}' | sort | uniq -c | sort -nr | head -n 6 | tail -n 5`
# Step 5: Summary Report

summary_report="log_summary_$(date +%Y-%m-%d).txt"
{
    echo
    echo "-------------Log Analyzer Report-------------"
    echo
    echo -e "Date of analysis: $(date)"
    echo -e "Log file name: $log_file"
    echo -e "Total lines processed: $total_lines"
    echo -e "Total error count: $error_count"
    echo -e "\nTop 5 error messages with their occurrence count:"
    echo
    echo -e "$top_error"
    echo
    echo -e "\nList of critical events with line numbers:"
    echo
    for event in "${critical_events[@]}"; do
        echo "$event"
    done
} > "$summary_report"

echo "Analysis complete. Summary report generated: $summary_report"

# Step 6: Optional Enhancement save log file in folder
 designated_directory="archive"
 mkdir -p "$designated_directory"
 mv "$log_file" "$designated_directory/"
echo "Log file archived to: $designated_directory"
