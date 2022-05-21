#!/bin/sh
. ./units.sh

kbev=$(get_keyboard_eventnum)
ctrl_v $kbev
