#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Provide exactly one argument."
    exit 1
fi

if [ -f "$1" ]; then
    echo "File analysis:"
    wc "$1"
elif [ -d "$1" ]; then
    echo "Directory analysis:"
    echo "Total files: $(find "$1" -type f | wc -l)"
    echo "Text files: $(find "$1" -type f -name "*.txt" | wc -l)"
else
    echo "Error: Path does not exist."
fi

