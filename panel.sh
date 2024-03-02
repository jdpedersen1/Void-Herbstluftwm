#!/usr/bin/env bash

# Terminate already running bar instances
 pkill -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c "$HOME"/.config/polybar/polybar_4/config mainbar-right & polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-left &\
        polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-right-1 & polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-right-2 & polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-right-3 &\
        polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-right-4 & polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-center &
  done
else
  polybar --reload -c "$HOME"/.config/polybar/polybar_4/config mainbar-right & polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-left & polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-right-1\
      & polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-right-2 & polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-right-3 & polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-right-4 &\
      polybar -c "$HOME"/.config/polybar/polybar_4/config mainbar-center &
fi


