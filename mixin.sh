#!/bin/bash
num=$(grep -n \# $1 | awk -F: '{print $1}')
file=$(grep -n \# $1 | awk -F: '{print $2}' | awk '{print $2}')

if [ -n "$num" ] ; then
    sed "${num}d" $1 > $2
    sed -i "${num} a
" $2
    sed -i "${num}r $file" $2

else
    echo "Null"
    cp $1 $2
fi

