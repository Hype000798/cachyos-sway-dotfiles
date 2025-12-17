#!/bin/bash

# Start swww daemon and set the wallpaper
pkill swww-daemon  # Kill any existing daemon
sleep 1
swww-daemon &
sleep 2
swww img "$HOME/Pictures/Wallpaper-4k.jpg" --transition-type fade --transition-duration 2