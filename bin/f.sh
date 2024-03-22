#!/bin/bash

PS3="Choose an application to open the file."
options=("qpdfview" "pluma" "micro" "abiword" "libreoffice" "vlc" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "qpdfview" )
           xhost si:localuser:root && qpdfview "$(fd --max-depth 6 -H| fzf)"
            ;;
        "pluma")
           xhost si:localuser:root && pluma $(fzf)
            ;;
        "micro")
           xhost si:localuser:root && micro $(fzf)
            ;;
        "abiword")
           xhost si:localuser:root && abiword $(fzf)
            ;;
        "libreoffice")
           xhost si:localuser:root && libreoffice $(fzf)
            ;;
         "vlc")
           xhost si:localuser:root && vlc $(fzf)
            ;;
        "Quit")openclose() {
    "$@" &
    disown
    exit
}
            echo "Quit"
            break
            ;;
    *) echo "Invalid Option $REPLY";;
    esac
done
