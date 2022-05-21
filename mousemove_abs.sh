#!/bin/sh

eventnum=$1
X=$2
Y=$3

bash mousemove_rel.sh $eventnum -20000 -20000 && sleep 0.02 && 

bash mousemove_rel.sh $eventnum $X $Y && sleep 0.02

