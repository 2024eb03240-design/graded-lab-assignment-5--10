#!/bin/bash

# Extract valid emails
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt | sort | uniq > valid.txt

# Extract invalid emails
grep -Ev '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt

echo "Valid emails:"
cat valid.txt
echo
echo "Invalid emails:"
cat invalid.txt
