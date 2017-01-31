#!/bin/sh

gpu="$(sudo prime-select query 2>/dev/null)"
printf 'Currently using %s graphics card.\n' "$gpu"
if [ "$1" = "dock" ]; then
    echo "Docking"
    echo "Setting displays"
    xrandr --output DP-3.1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-3.2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-3.3 --mode 1920x1080 --pos 3840x0 --rotate normal --output eDP-1-1 --off --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off
    xfconf-query -c xfce4-panel -p /panels/panel-0/output-name -s monitor-1 
elif [ "$1" = "undock" ]; then
    echo "Disengaging Dock"
    echo "Setting eDP as main and only display"
    xrandr --output DP-3.1 --off --output DP-3.2 --off --output DP-3.3 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off
    xfconf-query -c xfce4-panel -p /panels/panel-0/output-name -s auto 
elif [ "$1" = "dock_eDP" ]; then
    echo "Docking with Internal Display Active"
    echo "Setting displays"
    xrandr --output DP-3.1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-3.2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-3.3 --mode 1920x1080 --pos 3840x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off
    xfconf-query -c xfce4-panel -p /panels/panel-0/output-name -s monitor-2
else
    echo "Choices: dock|dock_eDP|undock"
fi
