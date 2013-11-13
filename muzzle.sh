#!/bin/bash
MUZZLEFILE=/tmp/.muzzle

if [ -e $MUZZLEFILE ]
then
    rm -f $MUZZLEFILE
    echo "Muzzle Removed"
else
    touch $MUZZLEFILE
    echo "Muzzle Applied"
fi
