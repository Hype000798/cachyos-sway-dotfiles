#!/bin/bash
# Enhanced screenshot script with Fuzzel menu

# Function to show screenshot options with fuzzel
show_screenshot_menu() {
    options="Area Screenshot\nWindow Screenshot\nFull Screen Screenshot\nScreen with cursor"
    
    choice=$(echo -e "$options" | fuzzel --dmenu --prompt="Screenshot: " --lines=4)
    
    case "$choice" in
        "Area Screenshot")
            grim -g "$(slurp)" - | wl-copy
            notify-send "Screenshot" "Area screenshot copied to clipboard"
            ;;
        "Window Screenshot")
            winid=$(swaymsg -t get_tree | jq -r '..|select(.type?)|select(.focused==true).id')
            grim -g "$(swaymsg -t get_tree | jq -r "..|select(.type?)|select(.focused==true).rect | \"\(.x),\(.y) \(.width)x\(.height)\"")" - | wl-copy
            notify-send "Screenshot" "Window screenshot copied to clipboard"
            ;;
        "Full Screen Screenshot")
            mkdir -p "$HOME/Pictures/Screenshots"
            grim -t png "$HOME/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png" && grim - | wl-copy
            notify-send "Screenshot" "Full screen screenshot saved and copied to clipboard"
            ;;
        "Screen with cursor")
            mkdir -p "$HOME/Pictures/Screenshots"
            grim -c -t png "$HOME/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png" && grim -c - | wl-copy
            notify-send "Screenshot" "Full screen screenshot with cursor saved and copied to clipboard"
            ;;
        *)
            # User cancelled
            exit 0
            ;;
    esac
}

# If an argument is provided, use it directly (for keybindings)
if [ -n "$1" ]; then
    case "$1" in
        "area"|"window"|"screen"|"cursor")
            # Use original behavior for keybindings
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
                "cursor")
                    mkdir -p "$HOME/Pictures/Screenshots"
                    grim -c -t png "$HOME/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png" && grim -c - | wl-copy
                    notify-send "Screenshot" "Full screen screenshot with cursor saved and copied to clipboard"
                    ;;
            esac
            ;;
        *)
            show_screenshot_menu
            ;;
    esac
else
    # No argument - show menu
    show_screenshot_menu
fi