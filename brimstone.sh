#!/bin/bash

SRC=$1
DEST=$2
DEST_EXT=iPad.mp4
HANDBRAKE_CLI=HandBrakeCLI
FLAGS=--preset="iPad"

for FILE in `ls $SRC`
do
    filename=$FILE.iPad.mp4
    echo "$HANDBRAKE_CLI -i $SRC/$FILE -o $DEST/$filename.$DEST_EXT $FLAGS"
done
