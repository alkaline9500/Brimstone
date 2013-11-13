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
        filename=$(basename "$JOB")
        HandBrakeCLI -i "$JOB" -o "/home/alkaline/Downloads/sync/$filename.nocon.iPad.mp4" --preset="iPad"
        #HandBrakeCLI -i "$JOB" -o "$filename.nocon.iPad.mp4" --preset="iPad"
        JOB=`head -n 1 $LOCKFILE`
        tail -n +2 "$LOCKFILE" > "$TMPFILE"
        mv "$TMPFILE" "$LOCKFILE"
    done
    rm $LOCKFILE
    /home/alkaline/Programming/Bark/mailman.py "Finished converting queue"
fi
