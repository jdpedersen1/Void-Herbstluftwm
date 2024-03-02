#!/bin/bash

hc() {
    herbstclient "$@"
}

HC emit_hook reload

# AUTOSTART #
#-----------#

nm-applet &
picom --experimental-backends &
xfce4-power-manager &
mpd --no-daemon "$HOME"/.config/mpd/mpd.conf &
mpDris2 -c "$HOME"/.config/mpDris2/mpDris2.conf &
./panel.sh
#polybar --config =$HOME/.config/herbstluftwm/polybar_void_config &
/usr/bin/gnome-keyring-daemon --start --components=secrets
batticon(){
    batt="$(pidof cbatticon)"
    if [[ "$batt" -lt 1 ]];
    then 
        cbatticon -i notification /sys/class/power_supply/BAT0 &
    else
        pkill cbatticon;
        cbatticon -i notification /sys/class/power_supply/BAT0 &
    fi
}
volicon(){
    vol="$(pidof volumeicon)"
    if [[ "$vol" -lt 1 ]];
    then 
        volumeicon &
    else
        pkill volumeicon;
        volumeicon &
    fi
}
#volicon
#batticon

#$HOME/.config/herbstluftwm/xmobar && herbstclient use_index 1
#sleep 4 && trayer --edge top --align right --widthtype request --padding 3 --iconspacing 5 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x181818 --height 20 &

# KEYBINDINGS #
#-------------#
. "$HOME"/.config/herbstluftwm/keys

# THEME #
#-------#
. "$HOME"/.config/herbstluftwm/HLWM_themes/theme

# RULES #
#-------#
. "$HOME"/.config/herbstluftwm/winRules

# FIND THE PANEL #
#----------------#
panel=~/.config/herbstluftwm/panel.sh
[ -x "$panel" ] || panel=/etc/xdg/herbstluftwm/panel.sh
for monitor in $(hc list_monitors | cut -d: -f1) ; do
    # start it on each monitor
    "$panel" "$monitor" &
done
hc split vertical 0.6; hc remove

