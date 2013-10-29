#!/bin/bash
LOCKFILE=.lockfile.brim
TMPFILE=.tempfile.brim

if [ -e $LOCKFILE ]
then
    echo "$1" >> $LOCKFILE
else
    touch $LOCKFILE
    JOB="$1"
    while [ ! -z "$JOB" ]
    do
        eval "$JOB"
        JOB=`head -n 1 $LOCKFILE`
        tail -n +2 "$LOCKFILE" > "$TMPFILE"
        mv "$TMPFILE" "$LOCKFILE"
    done
    rm $LOCKFILE
fi
