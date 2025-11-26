#!/bin/bash
# Simple swww initialization script

# Kill any existing swww daemon
pkill swww-daemon 2>/dev/null || true

# Wait a moment
sleep 1

# Start the swww daemon
swww-daemon &

# Wait for daemon to start
sleep 2

# Set the wallpaper
if [ -f "$HOME/Pictures/Wallpaper-4k.jpg" ]; then
    swww img "/home/hype/.config/backgrounds/02. Monokai.png" --transition-type any --transition-step 63 --transition-angle 0 --transition-duration 2 --transition-fps 60
else
    echo "Wallpaper file does not exist: $HOME/Pictures/Wallpaper-4k.jpg"
fi