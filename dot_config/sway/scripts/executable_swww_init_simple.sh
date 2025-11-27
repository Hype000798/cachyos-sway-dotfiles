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
swww img "/home/hype/.config/backgrounds/Wallpaper-4k.jpg" --transition-type any --transition-step 63 --transition-angle 0 --transition-duration 2 --transition-fps 60