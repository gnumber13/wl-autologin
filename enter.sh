#!/bin/sh

event=$1

sudo evemu-event /dev/input/$event --type EV_KEY --code KEY_ENTER --value 1
sudo evemu-event /dev/input/$event --type EV_KEY --code KEY_ENTER --value 0 --sync
