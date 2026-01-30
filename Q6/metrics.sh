#!/bin/bash

file="input.txt"

# Longest word
longest=$(tr ' ' '\n' < "$file" | awk '{ print length, $0 }' | sort -nr | head -1 | cut -d' ' -f2-)
echo "Longest word: $longest"

# Shortest word
shortest=$(tr ' ' '\n' < "$file" | awk '{ print length, $0 }' | sort -n | head -1 | cut -d' ' -f2-)
echo "Shortest word: $shortest"

# Average word length
total_chars=$(tr -d ' \n' < "$file" | wc -c)
total_words=$(wc -w < "$file")
avg=$(echo "scale=2; $total_chars / $total_words" | bc)
echo "Average word length: $avg"

# Total unique words
unique=$(tr ' ' '\n' < "$file" | sort | uniq | wc -l)
echo "Total unique words: $unique"
