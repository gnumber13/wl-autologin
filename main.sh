#!/usr/bin/env bash

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname "$SCRIPT")
# ./units.sh
. "$SCRIPTPATH"/units.sh

[ ! "$1" == "test" ] && le_password=$(pass roboform)

function commit {
    wl-copy $le_password
    ctrl_v $keyboard_eventnum
    kb_enter $keyboard_eventnum &
    wl-copy "123"
}

mouse_eventnum=$(get_mouse_eventnum)
keyboard_eventnum=$(get_keyboard_eventnum)

[ "$1" == "debug" ]  && echo "mouse: $mouse_eventnum, kboard: $keyboard_eventnum"


mousemove_rel $mouse_eventnum -20000 -20000

# absolute values:
[ "$1" == "debug" ]  && echo "mouse moving mouse..."
mousemove_rel $mouse_eventnum 1835 100
mousemove_rel $mouse_eventnum -5 -1

[ "$1" == "debug" ]  && echo "click"

click_btn_left $mouse_eventnum
sleep 0.2

[ "$1" == "debug" ]  && echo "copy pasta"

[ ! "$1" == "test" ] && commit
