#!/bin/bash

brightnessctl set 2%- &&
brightnessctl | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ printf "brightness = "$1} '| while read OUTPUT; do notify-send -r 6900 "$OUTPUT"; done



