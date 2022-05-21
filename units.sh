#!/bin/sh

function get_mouse_eventnum {
    echo $(cat /proc/bus/input/devices  | grep 'H:\|N:' | grep Mouse -A1 | grep H: | cut -d'=' -f2 | tr ' ' '\n' | grep event)
    #echo $(cat /proc/bus/input/devices | grep mouse | cut -d'=' -f2 | head -1 | tr ' ' '\n' | grep event)
}

function get_keyboard_eventnum {
    echo $(cat /proc/bus/input/devices | grep 'kbd' | grep 'sysrq' | tr ' ' '\n' | grep event)
}

function mousemove_rel {
    X=$2
    Y=$3
    event=$1

    # set to x and then y and commit
    sudo evemu-event /dev/input/$event \
            --type EV_REL --code REL_X --value $X --sync
    sudo evemu-event /dev/input/$event \
            --type EV_REL --code REL_Y --value $Y --sync
    sleep 0.1
}

function mousemove_abs {
    eventnum=$1
    X=$2
    Y=$3

    mousemove_rel $eventnum -20000 -20000 && sleep 0.02
    mousemove_rel $eventnum $X $Y && sleep 0.02
}

function ctrl_v {
    event=$1
    sudo evemu-event /dev/input/$event --type EV_KEY --code KEY_LEFTCTRL --value 1
    sudo evemu-event /dev/input/$event --type EV_KEY --code KEY_V --value 1
    sudo evemu-event /dev/input/$event --type EV_KEY --code KEY_V --value 0
    sudo evemu-event /dev/input/$event --type EV_KEY --code KEY_LEFTCTRL --value 0 --sync
}
 
function kb_enter {
    event=$1

    sudo evemu-event /dev/input/$event --type EV_KEY --code KEY_ENTER --value 1
    sudo evemu-event /dev/input/$event --type EV_KEY --code KEY_ENTER --value 0 --sync
}

function click_btn_left {
    event=$1
    sudo evemu-event /dev/input/$event --type EV_KEY --code BTN_TOOL_DOUBLETAP --value 1 --sync
    sudo evemu-event /dev/input/$event --type EV_KEY --code BTN_LEFT --value 1 --sync
    sudo evemu-event /dev/input/$event --type EV_KEY --code BTN_TOOL_DOUBLETAP --value 0 --sync 
    sudo evemu-event /dev/input/$event --type EV_KEY --code BTN_LEFT --value 0 --sync
}
