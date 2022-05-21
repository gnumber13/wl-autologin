#!/bin/sh

X=$2
Y=$3
event=$1

# set to x and then y and commit
sudo evemu-event /dev/input/$event \
        --type EV_REL --code REL_X --value $X --sync
sudo evemu-event /dev/input/$event \
        --type EV_REL --code REL_Y --value $Y --sync


