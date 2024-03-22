#!/bin/bash

PATH=/home/paul/.local/bin:/home/paul/Applications:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg

get_total_updates() { UPDATES=$(~/.local/bin/checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates

    # notify user of updates
    if hash notify-send &>/dev/null; then
        if (( UPDATES > 50 )); then
            notify-send -u critical -i $NOTIFY_ICON \
                "You really need to update!!" "$UPDATES New packages"
        elif (( UPDATES > 25 )); then
            notify-send -u normal -i $NOTIFY_ICON \
                "You should update soon" "$UPDATES New packages"
        elif (( UPDATES > 2 )); then
            notify-send -u low -i $NOTIFY_ICON \
                "$UPDATES New packages"
        fi
    fi

    # when there are updates available
    # every 3600 seconds another check for updates is done
    while (( UPDATES > 0 )); do
        if (( UPDATES == 1 )); then
            echo " $UPDATES"
        elif (( UPDATES > 1 )); then
            echo " $UPDATES"
        else
            echo " None"
        fi
        sleep 3600
        get_total_updates
    done

    # when no updates are available, use a longer loop, this saves on CPU
    # and network uptime, only checking once every 30 min for new updates
    while (( UPDATES == 0 )); do
        echo " None"
        sleep 1800
        get_total_updates
    done
done
