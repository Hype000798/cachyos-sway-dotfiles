#!/usr/bin/env bash

# Set the directory where the backgrounds are stored
BACKGROUND_DIR="$HOME/.config/backgrounds"

# Get the list of backgrounds
BACKGROUND_LIST=("$BACKGROUND_DIR"/*)
echo "Background list: ${BACKGROUND_LIST[@]}"

# Since using swww, we'll just cycle through the backgrounds directory
# Read the first image file from backgrounds as the current
# Handle quoted and unquoted paths in swww command
CURRENT_FILE=$(grep -oP "(?<=swww img \")[^\"]*(?=\"\s+--transition-type none)" "$HOME/.config/sway/scripts/swww_init_simple.sh" 2>/dev/null | head -n1)

# If not found with quotes, try without quotes
if [ -z "$CURRENT_FILE" ]; then
    CURRENT_FILE=$(grep -oP "(?<=swww img )[^\s]+(?=\s+--transition-type none)" "$HOME/.config/sway/scripts/swww_init_simple.sh" 2>/dev/null | head -n1)
fi

if [ -z "$CURRENT_FILE" ] || [[ "$CURRENT_FILE" == *"/Pictures/Wallpaper-4k.jpg"* ]]; then
    # If not found in swww script or it's the default, try to find from sway config (for backward compatibility)
    config_line=$(grep -oP "(?<=output \* bg ).*(?= fill)" $HOME/.config/sway/config 2>/dev/null | head -n1)
    if [ -n "$config_line" ]; then
        # Check if it's a full path, if not prepend backgrounds dir
        if [[ "$config_line" =~ ^/ ]]; then
            # Full path
            CURRENT_FILE="$config_line"
        else
            # Just filename, prepend backgrounds directory
            CURRENT_FILE="$HOME/.config/backgrounds/$config_line"
        fi
    else
        # If nothing found, start from first image
        CURRENT_FILE="${BACKGROUND_LIST[0]}"
    fi
else
    # The grep result might be a relative path, ensure it's a full path
    if [[ ! "$CURRENT_FILE" =~ ^/ ]]; then
        # It's relative, make it full path
        CURRENT_FILE="$HOME/.config/backgrounds/$CURRENT_FILE"
    fi
fi

echo "Current wallpaper file: $CURRENT_FILE"

# Find the index of the current background in the list
CURRENT_INDEX=0
FOUND_CURRENT=false
current_filename=$(basename "$CURRENT_FILE")

for i in "${!BACKGROUND_LIST[@]}"; do
    list_filename=$(basename "${BACKGROUND_LIST[$i]}")
    echo "Comparing $list_filename with $current_filename"
    if [[ "$list_filename" == "$current_filename" ]]; then
        CURRENT_INDEX=$i
        echo "Current index: $CURRENT_INDEX"
        FOUND_CURRENT=true
        break
    fi
done

# Calculate the index of the next background
TOTAL_BG_COUNT=${#BACKGROUND_LIST[@]}

# Debug info
echo "Total background count: $TOTAL_BG_COUNT"
echo "Current index: $CURRENT_INDEX"
echo "Found current: $FOUND_CURRENT"

if [[ "$FOUND_CURRENT" == true ]]; then
    # Calculate next index - for example, if current is 0 and total is 377, next should be (0+1)%377 = 1
    NEXT_INDEX=$(( (CURRENT_INDEX + 1) % TOTAL_BG_COUNT ))
    echo "Calculated next index: $NEXT_INDEX"

    # Double check the calculation
    TEST_CALCULATION=$(( (CURRENT_INDEX + 1) % TOTAL_BG_COUNT ))
    echo "Verification calculation: ($CURRENT_INDEX + 1) % $TOTAL_BG_COUNT = $TEST_CALCULATION"
else
    NEXT_INDEX=0  # Start from first if current not found
    echo "Starting from first: $NEXT_INDEX"
fi

echo "Final Next index: $NEXT_INDEX"

# Get the path of the next background
NEXT_BACKGROUND="${BACKGROUND_LIST[$NEXT_INDEX]}"

# Set the background using swww (modern wallpaper setter)
if command -v swww &>/dev/null; then
    swww img "$NEXT_BACKGROUND" --transition-type none
else
    # Fallback to swaybg if swww not available
    killall swaybg 2>/dev/null || true
    swaybg --output '*' --mode fill --image "$NEXT_BACKGROUND" &
fi

# Update the swww initialization script to use this wallpaper on startup
sed -i "s|^    swww img .* --transition-type none|    swww img \"$NEXT_BACKGROUND\" --transition-type none|" "$HOME/.config/sway/scripts/swww_init_simple.sh"

# Also update sway config for compatibility (though not used if using swww)
sed -i "s|^output \* bg.*|output \* bg $NEXT_BACKGROUND fill|" "$HOME/.config/sway/config" 2>/dev/null || true

# Send a notification with the new background name
notify-send -i "$NEXT_BACKGROUND" "Background changed" "$(basename "$NEXT_BACKGROUND")"

