#!/bin/bash

# Wofi Catppuccin Mocha Launcher Script
# This script launches Wofi with the Catppuccin Mocha theme

echo "Launching Wofi with Catppuccin Mocha theme..."

# Check for command line argument to determine which mode to use
if [ "$1" = "power" ]; then
    # Launch power menu
    ~/scripts/powermenu.sh
else
    # Launch application launcher
    wofi --show drun --style ~/.config/wofi/style.css --conf ~/.config/wofi/config
fi

echo "Wofi closed."