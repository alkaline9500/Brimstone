#!/bin/bash

pipe=.brimpipe

trap "rm -f #pipe" EXIT

if [[ ! -p $pipe ]]
then
    mkfifo $pipe
fi
while true
do
    if read line <$pipe
    then
        if [[ "$line" == 'quit' ]]
        then
            break
        fi
        sleep 10 && echo "$line"
    fi
done
echo "Reader exit"
