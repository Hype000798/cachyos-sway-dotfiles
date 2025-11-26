#!/usr/bin/env bash

# Set the directory where the backgrounds are stored
BACKGROUND_DIR="$HOME/.config/backgrounds"

# Get the list of backgrounds
BACKGROUND_LIST=()
while IFS= read -r -d '' file; do
    BACKGROUND_LIST+=("$file")
done < <(find "$BACKGROUND_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) -print0)

# Determine mode: if arg is "random", use random, otherwise cycle
MODE="cycle"
if [ "$1" = "random" ]; then
    MODE="random"
fi

if [ "$MODE" = "random" ]; then
    # Select a random background
    TOTAL_BG_COUNT=${#BACKGROUND_LIST[@]}
    if [ $TOTAL_BG_COUNT -gt 0 ]; then
        # Generate random index
        RANDOM_INDEX=$(( RANDOM % TOTAL_BG_COUNT ))
        NEXT_BACKGROUND="${BACKGROUND_LIST[$RANDOM_INDEX]}"
    else
        echo "No background files found in $BACKGROUND_DIR"
        exit 1
    fi
else
    # Cycling mode - get current wallpaper from swww_init_simple.sh
    CURRENT_FILE=$(grep -oP "(?<=swww img \")[^\"]*(?=\"\s+--transition-type none)" "$HOME/.config/sway/scripts/swww_init_simple.sh" 2>/dev/null | head -n1)
    
    # If not found with quotes, try without quotes
    if [ -z "$CURRENT_FILE" ]; then
        CURRENT_FILE=$(grep -oP "(?<=swww img )[^\s]+(?=\s+--transition-type none)" "$HOME/.config/sway/scripts/swww_init_simple.sh" 2>/dev/null | head -n1)
    fi

    if [ -z "$CURRENT_FILE" ] || [[ "$CURRENT_FILE" == *"/Pictures/Wallpaper-4k.jpg"* ]]; then
        # If not found in swww script or it's the default, start from first image
        CURRENT_FILE="${BACKGROUND_LIST[0]}"
    else
        # The grep result might be a relative path, ensure it's a full path
        if [[ ! "$CURRENT_FILE" =~ ^/ ]]; then
            # It's relative, make it full path
            CURRENT_FILE="$HOME/.config/backgrounds/$CURRENT_FILE"
        fi
    fi

    # Find the index of the current background in the list
    CURRENT_INDEX=0
    FOUND_CURRENT=false
    current_filename=$(basename "$CURRENT_FILE")

    for i in "${!BACKGROUND_LIST[@]}"; do
        list_filename=$(basename "${BACKGROUND_LIST[$i]}")
        if [[ "$list_filename" == "$current_filename" ]]; then
            CURRENT_INDEX=$i
            FOUND_CURRENT=true
            break
        fi
    done

    # Calculate the index of the next background (cycle to next)
    TOTAL_BG_COUNT=${#BACKGROUND_LIST[@]}
    
    if [[ "$FOUND_CURRENT" == true ]]; then
        NEXT_INDEX=$(( (CURRENT_INDEX + 1) % TOTAL_BG_COUNT ))
    else
        NEXT_INDEX=0  # Start from first if current not found
    fi

    NEXT_BACKGROUND="${BACKGROUND_LIST[$NEXT_INDEX]}"
fi

# Set the background using swww (modern wallpaper setter)
if command -v swww &>/dev/null; then
    swww img "$NEXT_BACKGROUND" --transition-type any --transition-step 63 --transition-angle 0 --transition-duration 2 --transition-fps 60
else
    # Fallback to swaybg if swww not available
    killall swaybg 2>/dev/null || true
    swaybg --output '*' --mode fill --image "$NEXT_BACKGROUND" &
fi

# Update the swww initialization script to use this wallpaper on startup
sed -i "s|^    swww img .* --transition-type any --transition-step 63 --transition-angle 0 --transition-duration 2 --transition-fps 60|    swww img \"$NEXT_BACKGROUND\" --transition-type any --transition-step 63 --transition-angle 0 --transition-duration 2 --transition-fps 60|" "$HOME/.config/sway/scripts/swww_init_simple.sh"

# Also update sway config for compatibility (though not used if using swww)
sed -i "s|^output \* bg.*|output \* bg $NEXT_BACKGROUND fill|" "$HOME/.config/sway/config" 2>/dev/null || true

# Send a notification with the new background name
notify-send -i "$NEXT_BACKGROUND" "Background changed" "$(basename "$NEXT_BACKGROUND") - $MODE mode"