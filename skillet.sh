#!/bin/bash

LOCKFILE=.lockfile.skil
RAWFILE=raw3gg
COOKEDFILE=cooked3gg
DEST_EXT=iPad.mp4
HANDBRAKE_CLI=HandBrakeCLI
FLAGS=--preset="iPad"

if [ -n "$1" ]
then
    cd "$1"
fi

echo "Skillet 1.0: "`date`

if [ -e $LOCKFILE ]
then
    echo "Conversion already running"
else
    touch $LOCKFILE
    echo "Searching directory $1"
    for FILE in `ls | grep "$RAWFILE"`
    do
        filename=`echo "$FILE" | sed "s/$RAWFILE/$COOKEDFILE/"`.$DEST_EXT
        echo "Converting $FILE to $filename..."
        $HANDBRAKE_CLI -i $FILE -o $filename $FLAGS
        rm $FILE
    done
    rm $LOCKFILE
fi
echo "Skillet Finished"
