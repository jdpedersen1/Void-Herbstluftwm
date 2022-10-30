#!/usr/bin/env bash

# Terminate already running bar instances
 pkill -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c $HOME/.config/herbstluftwm/polybar_void_config mainbar-herbst &
  done
else
  polybar --reload -c $HOME/.config/herbstluftwm/polybar_void_config mainbar-herbst &
fi

echo "Bars launched..."

