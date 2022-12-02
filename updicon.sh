#!/usr/bin/env bash

# Created By: Jake@Linux
# Created On: Thu 25 Aug 2022 02:20:52 PM CDT
# Project: sys tray icon for system updates


while true; do
upd="$(sudo xbps-install -SunM | wc -l)"
list="$(sudo xbps-install -nuM | awk '{print $1}')"
#inst="$(pidof yad)"
    
#if [[ $inst -eq " " ]]
#then
if (( "$upd" == 0 ));
then
    cat ~/.config/herbstluftwm/updateIcons/noupdate.png > ~/.config/herbstluftwm/updateIcons/trayIcon.png
    yad --text "$upd Updates" --notification --image=./.config/herbstluftwm/updateIcons/trayIcon.png
elif (( "$upd" <= 5 ));
then
    cat ~/.config/herbstluftwm/updateIcons/modupdate.png > ~/.config/herbstluftwm/updateIcons/trayIcon.png
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=./.config/herbstluftwm/updateIcons/trayIcon.png --menu="$list" --command "alacritty -e sudo xbps-install -Su"
elif (( "$upd" > 5 ));
then
    cat ~/.config/herbstluftwm/updateIcons/lotsupdate.png > ~/.config/herbstluftwm/updateIcons/trayIcon.png
    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
        --image=./.config/herbstluftwm/updateIcons/trayIcon.png --menu="$list" --command "alacritty -e sudo xbps-install -Su"
fi
#elif [[ $inst -gt "1" ]]
#then
#if (( "$upd" == 0 ));
#then
#    cat ~/.config/herbstluftwm/updateIcons/noupdate.png > ~/.config/herbstluftwm/updateIcons/trayIcon.png
#    yad --text "$upd Updates" --notification --image=./.config/herbstluftwm/updateIcons/trayIcon.png
#elif (( "$upd" <= 5 ));
#then
#    cat ~/.config/herbstluftwm/updateIcons/modupdate.png > ~/.config/herbstluftwm/updateIcons/trayIcon.png
#    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
#        --image=./.config/herbstluftwm/updateIcons/trayIcon.png --menu="$list" --command "alacritty -e sudo xbps-install -Su"
#elif (( "$upd" > 5 ));
#then
#    cat ~/.config/herbstluftwm/updateIcons/lotsupdate.png > ~/.config/herbstluftwm/updateIcons/trayIcon.png
#    yad --text "$upd Updates: Right click to see all updates, Left click to perform update" --notification\
#        --image=./.config/herbstluftwm/updateIcons/trayIcon.png --menu="$list" --command "alacritty -e sudo xbps-install -Su"
#fi
#fi
sleep 86400
done
