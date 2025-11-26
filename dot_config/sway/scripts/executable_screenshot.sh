#!/bin/bash
# Screenshot script with notification

case "$1" in
    "area")
        grim -g "$(slurp)" - | wl-copy
        notify-send "Screenshot" "Area screenshot copied to clipboard"
        ;;
    "window")
        winid=$(swaymsg -t get_tree | jq -r '..|select(.type?)|select(.focused==true).id')
        grim -g "$(swaymsg -t get_tree | jq -r "..|select(.type?)|select(.focused==true).rect | \"\(.x),\(.y) \(.width)x\(.height)\"")" - | wl-copy
        notify-send "Screenshot" "Window screenshot copied to clipboard"
        ;;
    "screen")
        mkdir -p "$HOME/Pictures/Screenshots"
        grim -t png "$HOME/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png" && grim - | wl-copy
        notify-send "Screenshot" "Full screen screenshot saved and copied to clipboard"
        ;;
    *)
        echo "Usage: $0 {area|window|screen}"
        ;;
esac