#!/bin/bash

file="words.txt"

# Only vowels
grep -i -E '^[aeiou]+$' "$file" > vowels.txt

# Only consonants
grep -i -E '^[^aeiou]+$' "$file" > consonants.txt

# Mixed but starting with consonant
grep -i -E '^[^aeiou]+[a-z]*[aeiou]+[a-z]*' "$file" > mixed.txt

echo "Words with only vowels:"
cat vowels.txt
echo
echo "Words with only consonants:"
cat consonants.txt
echo
echo "Words with both vowels and consonants starting with consonant:"
cat mixed.txt
