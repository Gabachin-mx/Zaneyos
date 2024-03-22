#!/bin/bash

amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print "vol = "$3 }' | while read OUTPUT; do notify-send -r 6900 "$OUTPUT"; done


