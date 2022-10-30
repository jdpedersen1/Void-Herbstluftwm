#!/usr/bin/env bash

# Created By: Jake@Linux
# Created On: Thu 25 Aug 2022 02:20:52 PM CDT
# Project: update icon

upd="$(sudo xbps-install -nuM | wc -l)"
note="$(pidof yad)"

if [[ "$upd" < 1 ]];
then
    if [[ "$note"  < 1 ]]; 
    then
        yad --notification --image=$HOME/Desktop/icon/noupdate.png --command=notify-send "$(sudo xbps-install -nuM | awk {'print $1'})"
    else
        pkill yad;
        yad --notification --image=$HOME/Desktop/icon/noupdate.png --command=notify-send "$(sudo xbps-install -nuM | awk {'print $1'})"
    fi
elif [[ "$upd" -le 5 ]];
then
    if [[ "$note" < 1 ]]; 
    then
        yad --notification --image=$HOME/Desktop/icon/modupdate.png --command=notify-send "$(sudo xbps-install -nuM | awk {'print $1'})"
    else
        pkill yad;
        yad --notification --image=$HOME/Desktop/icon/modupdate.png --command=notify-send "$(sudo xbps-install -nuM | awk {'print $1'})"
    fi
else
    if [[ "$note" < 1 ]];
    then
        yad --notification --image=$HOME/Desktop/icon/lotsupdate.png --command=notify-send "$(sudo xbps-install -nuM | awk {'print $1'})"
    else
        pkill yad;
        yad --notification --image=$HOME/Desktop/icon/lotsupdate.png --command=notify-send "$(sudo xbps-install -nuM | awk {'print $1'})"
    fi
fi
