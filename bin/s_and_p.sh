#!/usr/bin/env bash

/home/paul/.local/bin/stock.sh ^GSPC | awk '{print "S&P: "$4}' | while read OUTPUT; do notify-send -r 6900 "$OUTPUT"; done
