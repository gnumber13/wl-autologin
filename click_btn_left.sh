#!/bin/sh

event=$1
#sudo evemu-event /dev/input/event8 --type EV_KEY --code BTN_TOOL_FINGER --value 0 --sync && sleep 0.1
sudo evemu-event /dev/input/$event --type EV_KEY --code BTN_TOOL_DOUBLETAP --value 1 --sync && sleep 0.1

sudo evemu-event /dev/input/$event --type EV_KEY --code BTN_LEFT --value 1 --sync && sleep 0.1
#sudo evemu-event /dev/input/event8 --type EV_KEY --code BTN_TOOL_FINGER --value 1 --sync && sleep 0.1
sudo evemu-event /dev/input/$event --type EV_KEY --code BTN_TOOL_DOUBLETAP --value 0 --sync && sleep 0.1
sudo evemu-event /dev/input/$event --type EV_KEY --code BTN_LEFT --value 0 --sync && sleep 0.1

