#!/bin/bash

dir1="dirA"
dir2="dirB"

echo "Files only in $dir1:"
comm -23 <(ls "$dir1" | sort) <(ls "$dir2" | sort)

echo
echo "Files only in $dir2:"
comm -13 <(ls "$dir1" | sort) <(ls "$dir2" | sort)

echo
echo "Files in both with different contents:"
for f in $(ls "$dir1"); do
    if [ -f "$dir2/$f" ]; then
        cmp -s "$dir1/$f" "$dir2/$f" || echo "$f differs"
    fi
done
