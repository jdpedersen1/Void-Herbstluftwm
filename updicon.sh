#!/usr/bin/env bash

# Created By: Jake@Linux
# Created On: Thu 25 Aug 2022 02:20:52 PM CDT
# Project: sys tray icon for system updates

upd="$(sudo xbps-install -SunM | wc -l)"
list="$(sudo xbps-install -nuM | awk {'print $1'})"
inst="$(pidof yad)"


while true; do
if [[ $inst -eq " " ]]
then
if (( $upd == 0 ));
then
    cat $HOME/.config/herbstluftwm/updateIcons/noupdate.png > $HOME/.config/herbstluftwm/updateIcons/trayIcon.png
    yad --text "$upd Updates" --notification --image=$HOME/.config/herbstluftwm/updateIcons/trayIcon.png
elif (( $upd <= 5 ));
then
    cat $HOME/.config/herbstluftwm/updateIcons/modupdate.png > $HOME/.config/herbstluftwm/updateIcons/trayIcon.png
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=$HOME/.config/herbstluftwm/updateIcons/trayIcon.png --menu="$list" --command "alacritty -e sudo xbps-install -Su"
elif (( $upd > 5 ));
then
    cat $HOME/.config/herbstluftwm/updateIcons/lotsupdate.png > $HOME/.config/herbstluftwm/updateIcons/trayIcon.png
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=$HOME/.config/herbstluftwm/updateIcons/trayIcon.png --menu="$list" --command "alacritty -e sudo xbps-install -Su"
fi
elif [[ $inst -gt "1" ]]
then
if (( $upd == 0 ));
then
    cat $HOME/.config/herbstluftwm/updateIcons/noupdate.png > $HOME/.config/herbstluftwm/updateIcons/trayIcon.png
    yad --text "$upd Updates" --notification --image=$HOME/.config/herbstluftwm/updateIcons/trayIcon.png
elif (( $upd <= 5 ));
then
    cat $HOME/.config/herbstluftwm/updateIcons/modupdate.png > $HOME/.config/herbstluftwm/updateIcons/trayIcon.png
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=$HOME/.config/herbstluftwm/updateIcons/trayIcon.png --menu="$list" --command "alacritty -e sudo xbps-install -Su"
elif (( $upd > 5 ));
then
    cat $HOME/.config/herbstluftwm/updateIcons/lotsupdate.png > $HOME/.config/herbstluftwm/updateIcons/trayIcon.png
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=$HOME/.config/herbstluftwm/updateIcons/trayIcon.png --menu="$list" --command "alacritty -e sudo xbps-install -Su"
fi
fi
sleep 20
done
