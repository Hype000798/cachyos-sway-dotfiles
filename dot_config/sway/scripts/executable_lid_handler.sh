#!/bin/bash
# Simple lid close handler

# Monitor lid state changes
while true; do
    # Read the lid state from the system
    if [ -f /proc/acpi/button/lid/LID/state ]; then
        state=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')
        
        if [ "$state" = "closed" ]; then
            # Lock immediately when lid is closed
            hyprlock &
            sleep 1
        fi
    fi
    
    sleep 1
done