#!/bin/sh

# Terminate already running instances
pkill swayidle

# Set up swayidle with lid close hook
swayidle \
    -w \
    timeout 300 'swaylock -f -c 000000' \
    timeout 600 'swaymsg "output * power off"' \
    resume 'swaymsg "output * power on"' \
    before-sleep 'hyprlock || swaylock -f -c 000000' \
    lid-closed 'hyprlock || swaylock -f -c 000000' &