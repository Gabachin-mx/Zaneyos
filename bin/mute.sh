#!/bin/bash

amixer set Capture toggle && amixer get Capture | grep "\[off\]" && notify-send "unmute" || notify-send "mute"
