#!/usr/bin/env bash
# curl -f -s -m 2 'wttr.in?format=3' || printf '\n' | notify-send

weather () (curl -f -s -m 2 'wttr.in?format=3' || printf '\n')

if $weather; then 
 notify-send "$(curl -f -s -m 2 'wttr.in?format=3' || printf '\n')"
 
 else notify-send "no weather report given"
 fi
