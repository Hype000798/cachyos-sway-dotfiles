# Wofi Catppuccin Mocha Configuration

This configuration sets up Wofi with the Catppuccin Mocha theme.

## Files included:

- `config` - Basic configuration file for Wofi
- `config.rasi` - Advanced configuration file using Rasi format
- `style.css` - Catppuccin Mocha theme styling (with translucency)
- `launch.sh` - Script to launch Wofi with the theme

## Additional Scripts:

- `~/scripts/wofi-launcher.sh` - Main launcher script supporting both app launcher and power menu
- `~/scripts/powermenu.sh` - Power menu with shutdown, reboot, logout, etc.

## How to use:

1. Launch application launcher: `~/scripts/wofi-launcher.sh`
2. Launch power menu: `~/scripts/wofi-launcher.sh --power`
3. Or run directly: `wofi --show drun --gtk-css ~/.config/wofi/style.css`

## Binding to a key:

You can add this to your Sway/Wayland config or i3/X11 config:
```
# For Sway - Mod+D for app launcher, Mod+Shift+D for power menu
bindsym $mod+d exec --no-startup-id ~/scripts/wofi-launcher.sh
bindsym $mod+Shift+d exec --no-startup-id ~/scripts/wofi-launcher.sh --power

# For i3 - Mod+D for app launcher, Mod+Shift+D for power menu
bindsym $mod+d exec --no-startup-id ~/scripts/wofi-launcher.sh
bindsym $mod+Shift+d exec --no-startup-id ~/scripts/wofi-launcher.sh --power
```

## Notes:

- The Catppuccin icon theme has been installed to `~/.local/share/icons/catppuccin-icons`
- You can find more information about Catppuccin at https://github.com/catppuccin
- The theme uses the Mocha variant with blue accents
- The UI has translucent/blur effects using backdrop-filter