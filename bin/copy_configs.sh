#!/bin/bash

NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg

cp ~/.config/i3/config ~/.config/i3/config.bk && 
cp ~/.config/xmonad/xmonad.hs ~/.config/xmonad/xmonad.hs.bk  && 
cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.bk && 
cp /home/paul/.config/waybar/config.jsonc /home/paul/.config/waybar/config.json.bk &&
cp /home/paul/.config/waybar/style.css /home/paul/.config/waybar/style.css.bk
notify-send -u normal -i $NOTIFY_ICON \ "backed up configs!"



