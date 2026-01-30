#!/bin/bash

# Check argument count
if [ $# -ne 1 ]; then
    echo "Usage: $0 logfile"
    exit 1
fi

# Check if file exists and readable
if [ ! -r "$1" ]; then
    echo "Error: File not readable or does not exist."
    exit 1
fi

# Count log entries
total=$(wc -l < "$1")
info=$(grep -c " INFO " "$1")
warn=$(grep -c " WARNING " "$1")
error=$(grep -c " ERROR " "$1")

# Most recent ERROR
latest_error=$(grep " ERROR " "$1" | tail -1)

# Generate report file
date=$(date +%Y%m%d)
report="logsummary_$date.txt"

{
echo "Total entries: $total"
echo "INFO: $info"
echo "WARNING: $warn"
echo "ERROR: $error"
echo "Most recent ERROR:"
echo "$latest_error"
} > "$report"

# Display report
cat "$report"
