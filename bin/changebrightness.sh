#!/bin/bash

brightnessctl | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ printf "brightness = ""%d\n",$4} '| while read OUTPUT; do notify-send -r 6900 "$OUTPUT"%""; done

#brightnessctl | grep brightness | awk '{print "brightness: " substr(brightness = $4, 2);}' | rev | cut -c2- | rev | while read OUTPUT; do notify-send -r 6900 "$OUTPUT"; done





