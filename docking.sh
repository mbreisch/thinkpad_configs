#!/bin/sh

gpu="$(sudo prime-select query 2>/dev/null)"

toggle_gpu() {
    printf 'Currently using %s graphics card.\n' "$gpu"
    if [ "$gpu" = "intel"]; then
        echo "Switching to the nvidia discrete gpu"
        sudo prime-select nvidia 2>/dev/null
        echo "Please logout and log back in to complete the gpu switch and run command again to activate displays"
    else
        echo "Switching to the intel gpu"
        sudo prime-select intel 2>/dev/null
        echo "Please logout and log back in to complete the gpu switch"
   fi
}

if [ "$1" = "dock" ]; then
    echo "Docking"
    if [ "$gpu" = "intel" ]; then
        toggle_gpu
    else
        echo "Setting displays"
        xrandr --output DP-3.1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-3.2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-3.3 --mode 1920x1080 --pos 3840x0 --rotate normal --output eDP-1-1 --off --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off
        xfconf-query -c xfce4-panel -p /panels/panel-0/output-name -s monitor-1 
    fi
elif [ "$1" = "undock" ]; then
    echo "Disengaging Dock"
    echo "Setting eDP as main and only display"
    xrandr --output DP-3.1 --off --output DP-3.2 --off --output DP-3.3 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off
    if [ "$gpu" = "nvidia" ]; then
        toggle_gpu
    fi
    xfconf-query -c xfce4-panel -p /panels/panel-0/output-name -s auto 
elif [ "$1" = "dock_eDP" ]; then
    echo "Docking with Internal Display Active"
    if [ "$gpu" = "intel" ]; then
        toggle_gpu
    else
        echo "Setting displays"
        xrandr --output DP-3.1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-3.2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-3.3 --mode 1920x1080 --pos 3840x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off --output DP-0 --off
        xfconf-query -c xfce4-panel -p /panels/panel-0/output-name -s monitor-2
    fi
else
    echo "Choices: dock|dock_eDP|undock"
fi
