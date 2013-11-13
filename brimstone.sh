#!/bin/bash

LOCKFILE=.lockfile.brim
SRC=$1
DEST=$2
DEST_EXT=iPad.mp4
HANDBRAKE_CLI=HandBrakeCLI
FLAGS=--preset="iPad"


if [ -e $LOCKFILE ]
then
    echo "Conversion already running"
else
    touch $LOCKFILE
    for FILE in `ls $SRC`
    do
        filename=$FILE.iPad.mp4
        $HANDBRAKE_CLI -i $SRC/$FILE -o $DEST/$filename.$DEST_EXT $FLAGS
    done
    rm $LOCKFILE
    /home/alkaline/bin/sendsms "Brimstone finished converting"
fi
