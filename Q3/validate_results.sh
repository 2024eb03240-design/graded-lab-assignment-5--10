#!/bin/bash

pass_all=0
fail_one=0

while IFS=',' read -r roll name m1 m2 m3
do
    fails=0
    for m in $m1 $m2 $m3
    do
        [ "$m" -lt 33 ] && fails=$((fails+1))
    done

    if [ "$fails" -eq 0 ]; then
        echo "$name passed all subjects"
        pass_all=$((pass_all+1))
    elif [ "$fails" -eq 1 ]; then
        echo "$name failed exactly one subject"
        fail_one=$((fail_one+1))
    fi
done < marks.txt

echo "Total students passed all subjects: $pass_all"
echo "Total students failed exactly one subject: $fail_one"
