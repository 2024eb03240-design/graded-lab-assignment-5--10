#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 directory_path"
    exit 1
fi

dir="$1"
backup="$dir/backup"

mkdir -p "$backup"

for file in "$dir"/*; do
    if [ -f "$file" ]; then
        mv "$file" "$backup/" &
        echo "Moving $file in background, PID: $!"
    fi
done

wait
echo "All background move operations completed."
