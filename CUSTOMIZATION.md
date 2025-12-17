# Customization Guide

Comprehensive guide for customizing your CachyOS Sway dotfiles setup.

## Table of Contents

- [Getting Started](#getting-started)
- [Color Schemes & Themes](#color-schemes--themes)
- [Sway Configuration](#sway-configuration)
- [Waybar Customization](#waybar-customization)
- [Application Themes](#application-themes)
- [Fonts](#fonts)
- [Wallpapers](#wallpapers)
- [Scripts Customization](#scripts-customization)
- [Keybindings](#keybindings)
- [Window Rules](#window-rules)
- [Visual Effects](#visual-effects)

## Getting Started

### Understanding chezmoi

All configurations are managed by `chezmoi`. To edit files:

1. **Edit source files**:
   ```bash
   chezmoi edit ~/.config/sway/config
   # Or directly edit
   nano ~/.local/share/chezmoi/dot_config/sway/config
   ```

2. **Preview changes**:
   ```bash
   chezmoi diff
   ```

3. **Apply changes**:
   ```bash
   chezmoi apply
   ```

4. **Reload Sway**:
   ```bash
   swaymsg reload
   # Or press Mod+Shift+c
   ```

### Directory Structure

```
~/.local/share/chezmoi/
├── dot_config/
│   ├── sway/
│   │   ├── config
│   │   ├── config.d/
│   │   │   ├── 00-colors.conf
│   │   │   ├── default-options-and-keymaps.conf
│   │   │   ├── theme.conf
│   │   │   └── ...
│   │   └── scripts/
│   ├── waybar/
│   │   ├── config.jsonc
│   │   └── style.css
│   ├── fuzzel/
│   ├── wezterm/
│   └── ...
```

## Color Schemes & Themes

### Current Theme: Catppuccin Mocha

The default setup uses Catppuccin Mocha color palette.

#### Sway Colors

Edit [00-colors.conf](../cachyos-sway-dotfiles-main/dot_config/sway/config.d/00-colors.conf):

```bash
chezmoi edit ~/.config/sway/config.d/00-colors.conf
```

**Color Variables**:
```bash
# Catppuccin Mocha colors
set $rosewater #f5e0dc
set $flamingo #f2cdcd
set $pink #f5c2e7
set $mauve #cba6f7
set $red #f38ba8
set $maroon #eba0ac
set $peach #fab387
set $yellow #f9e2af
set $green #a6e3a1
set $teal #94e2d5
set $sky #89dceb
set $sapphire #74c7ec
set $blue #89b4fa
set $lavender #b4befe

set $text #cdd6f4
set $subtext1 #bac2de
set $subtext0 #a6adc8
set $overlay2 #9399b2
set $overlay1 #7f849c
set $overlay0 #6c7086
set $surface2 #585b70
set $surface1 #45475a
set $surface0 #313244

set $base #1e1e2e
set $mantle #181825
set $crust #11111b
```

#### Changing to Different Color Scheme

1. **Choose a color scheme**: Browse [terminal.sexy](https://terminal.sexy/) or [Gogh](https://gogh-co.github.io/Gogh/)

2. **Update colors.conf**:
   ```bash
   # Example: Nord theme
   set $nord0 #2e3440
   set $nord1 #3b4252
   set $nord2 #434c5e
   set $nord3 #4c566a
   set $nord4 #d8dee9
   set $nord5 #e5e9f0
   set $nord6 #eceff4
   set $nord7 #8fbcbb
   set $nord8 #88c0d0
   set $nord9 #81a1c1
   set $nord10 #5e81ac
   set $nord11 #bf616a
   set $nord12 #d08770
   set $nord13 #ebcb8b
   set $nord14 #a3be8c
   set $nord15 #b48ead
   ```

3. **Update window decorations**:
   ```bash
   # In theme.conf
   client.focused          $nord10 $nord10 $nord6 $nord8
   client.focused_inactive $nord1 $nord1 $nord4 $nord3
   client.unfocused        $nord0 $nord0 $nord4 $nord3
   client.urgent           $nord11 $nord11 $nord6 $nord11
   ```

4. **Update Waybar colors** (see [Waybar Customization](#waybar-customization))

5. **Apply and reload**:
   ```bash
   chezmoi apply
   swaymsg reload
   ```

---

## Sway Configuration

### Window Behavior

Edit [default-options-and-keymaps.conf](cachyos-sway-dotfiles-main/dot_config/sway/config.d/default-options-and-keymaps.conf):

```bash
# Default border style
default_border pixel 2
default_floating_border pixel 2

# Hide borders at screen edges
hide_edge_borders smart

# Focus behavior
focus_follows_mouse yes
focus_on_window_activation smart

# Workspace auto back and forth
workspace_auto_back_and_forth yes

# Mouse warping
mouse_warping container

# Popup behavior during fullscreen
popup_during_fullscreen smart
```

### Gaps Configuration

```bash
# Gaps
gaps inner 10
gaps outer 5

# Smart gaps (no gaps for single window)
smart_gaps on

# Smart borders
smart_borders on
```

### Output Configuration

Edit [outputs.conf](cachyos-sway-dotfiles-main/dot_config/sway/config.d/outputs.conf):

```bash
# Primary display
output eDP-1 {
    resolution 1920x1080
    position 0,0
    scale 1
    bg ~/.config/backgrounds/default.jpg fill
}

# External monitor
output HDMI-A-1 {
    resolution 2560x1440
    position 1920,0
    scale 1
    bg ~/.config/backgrounds/default.jpg fill
}

# Disable laptop screen when lid closed
bindswitch --reload --locked lid:on output eDP-1 disable
bindswitch --reload --locked lid:off output eDP-1 enable
```

**Finding output names**:
```bash
swaymsg -t get_outputs
```

### Input Configuration

Edit [inputs.conf](cachyos-sway-dotfiles-main/dot_config/sway/config.d/inputs.conf):

```bash
# Touchpad
input type:touchpad {
    tap enabled
    natural_scroll enabled
    dwt enabled  # disable while typing
    accel_profile adaptive
    pointer_accel 0.5
    scroll_factor 1.0
}

# Keyboard
input type:keyboard {
    xkb_layout "us"
    xkb_variant ""
    xkb_options "caps:escape,compose:ralt"
    repeat_delay 300
    repeat_rate 50
}

# Mouse
input type:pointer {
    accel_profile flat
    pointer_accel 0
}
```

**Common xkb_options**:
- `caps:escape` - Map Caps Lock to Escape
- `caps:ctrl_modifier` - Caps Lock as Ctrl
- `compose:ralt` - Right Alt as compose key
- `grp:alt_shift_toggle` - Alt+Shift to switch layouts

---

## Waybar Customization

### Layout Configuration

Edit [config.jsonc](cachyos-sway-dotfiles-main/dot_config/waybar/config.jsonc):

```json
{
    "layer": "top",
    "position": "top",
    "height": 36,
    "margin-top": 10,
    "margin-bottom": 0,
    "margin-left": 10,
    "margin-right": 10,
    "spacing": 2,
    
    "modules-left": [
        "clock",
        "disk",
        "cpu",
        "memory"
    ],
    "modules-center": [
        "sway/workspaces"
    ],
    "modules-right": [
        "sway/window",
        "tray",
        "pulseaudio",
        "network",
        "battery"
    ]
}
```

### Module Configuration Examples

#### Custom Clock Format
```json
"clock": {
    "format": "{:%I:%M %p}",
    "format-alt": "{:%A, %B %d, %Y}",
    "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
}
```

#### CPU Module
```json
"cpu": {
    "interval": 10,
    "format": " {usage}%",
    "max-length": 10,
    "on-click": "wezterm -e htop"
}
```

#### Memory Module
```json
"memory": {
    "interval": 30,
    "format": " {}%",
    "max-length": 10,
    "tooltip-format": "RAM: {used:0.1f}GB / {total:0.1f}GB\nSwap: {swapUsed:0.1f}GB / {swapTotal:0.1f}GB"
}
```

#### Battery with Custom States
```json
"battery": {
    "states": {
        "warning": 30,
        "critical": 15
    },
    "format": "{icon} {capacity}%",
    "format-charging": " {capacity}%",
    "format-plugged": " {capacity}%",
    "format-icons": ["", "", "", "", ""]
}
```

#### Network with Custom Format
```json
"network": {
    "format-wifi": " {essid}",
    "format-ethernet": " Connected",
    "format-disconnected": "⚠ Disconnected",
    "tooltip-format": "{ifname}: {ipaddr}/{cidr}\nStrength: {signalStrength}%",
    "on-click": "networkmanager_dmenu"
}
```

#### Custom Weather Module
```json
"custom/weather": {
    "exec": "~/.config/waybar/scripts/weather.sh",
    "interval": 1800,
    "format": "{}",
    "tooltip": true
}
```

### Styling Waybar

Edit [style.css](cachyos-sway-dotfiles-main/dot_config/waybar/style.css):

```css
/* Global styles */
* {
    font-family: "JetBrains Mono Nerd Font";
    font-size: 14px;
    min-height: 0;
}

window#waybar {
    background-color: rgba(30, 30, 46, 0.8);
    border-radius: 12px;
    color: #cdd6f4;
}

/* Workspace buttons */
#workspaces button {
    padding: 0 10px;
    background-color: transparent;
    color: #cdd6f4;
    border-radius: 8px;
}

#workspaces button.focused {
    background-color: #89b4fa;
    color: #1e1e2e;
}

#workspaces button.urgent {
    background-color: #f38ba8;
    color: #1e1e2e;
}

/* Individual modules */
#clock {
    background-color: #89b4fa;
    color: #1e1e2e;
    padding: 0 15px;
    margin: 5px;
    border-radius: 8px;
}

#battery {
    background-color: #a6e3a1;
    color: #1e1e2e;
    padding: 0 15px;
    margin: 5px;
    border-radius: 8px;
}

#battery.warning {
    background-color: #f9e2af;
}

#battery.critical {
    background-color: #f38ba8;
    animation: blink 1s linear infinite;
}

@keyframes blink {
    50% { opacity: 0.5; }
}

#network {
    background-color: #94e2d5;
    color: #1e1e2e;
    padding: 0 15px;
    margin: 5px;
    border-radius: 8px;
}

#pulseaudio {
    background-color: #f5c2e7;
    color: #1e1e2e;
    padding: 0 15px;
    margin: 5px;
    border-radius: 8px;
}

/* Custom colors */
#cpu {
    background-color: #fab387;
    color: #1e1e2e;
}

#memory {
    background-color: #cba6f7;
    color: #1e1e2e;
}

/* Tooltip styling */
tooltip {
    background-color: #1e1e2e;
    border: 2px solid #89b4fa;
    border-radius: 8px;
}

tooltip label {
    color: #cdd6f4;
}
```

---

## Application Themes

### Terminal (Wezterm)

Edit [wezterm.lua](cachyos-sway-dotfiles-main/dot_config/wezterm/wezterm.lua):

```lua
local wezterm = require 'wezterm'
local config = {}

-- Color scheme
config.color_scheme = 'Catppuccin Mocha'
-- Or use custom colors
-- config.colors = {
--     foreground = '#cdd6f4',
--     background = '#1e1e2e',
--     -- ... more colors
-- }

-- Font
config.font = wezterm.font('JetBrains Mono Nerd Font')
config.font_size = 12.0

-- Window appearance
config.window_background_opacity = 0.95
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

return config
```

**Popular Wezterm color schemes**:
- Catppuccin Mocha
- Nord
- Dracula
- Tokyo Night
- Gruvbox Dark

### Fuzzel Launcher

Edit [fuzzel.ini](cachyos-sway-dotfiles-main/dot_config/fuzzel/fuzzel.ini):

```ini
[main]
font=JetBrains Mono Nerd Font:size=12
dpi-aware=yes
prompt=" > "
icon-theme=Papirus-Dark
layer=overlay

[colors]
background=1e1e2eee
text=cdd6f4ff
match=89b4faff
selection=313244ff
selection-text=cdd6f4ff
selection-match=89b4faff
border=89b4faff

[border]
width=2
radius=12
```

### File Manager (Yazi)

Edit [theme.toml](cachyos-sway-dotfiles-main/dot_config/yazi/theme.toml):

```toml
[manager]
cwd = { fg = "#89b4fa" }

# Hovered
hovered         = { fg = "#1e1e2e", bg = "#89b4fa" }
preview_hovered = { underline = true }

# Find
find_keyword  = { fg = "#f9e2af", italic = true }
find_position = { fg = "#f5c2e7", bg = "reset", italic = true }

# Marker
marker_selected = { fg = "#a6e3a1", bg = "#a6e3a1" }
marker_copied   = { fg = "#f9e2af", bg = "#f9e2af" }
marker_cut      = { fg = "#f38ba8", bg = "#f38ba8" }

# Tab
tab_active   = { fg = "#1e1e2e", bg = "#89b4fa" }
tab_inactive = { fg = "#cdd6f4", bg = "#313244" }
tab_width    = 1

# Border
border_symbol = "│"
border_style  = { fg = "#89b4fa" }

[status]
separator_open  = ""
separator_close = ""
separator_style = { fg = "#313244", bg = "#313244" }

# Mode
mode_normal = { fg = "#1e1e2e", bg = "#89b4fa", bold = true }
mode_select = { fg = "#1e1e2e", bg = "#a6e3a1", bold = true }
mode_unset  = { fg = "#1e1e2e", bg = "#f2cdcd", bold = true }
```

### GTK Applications

```bash
# Install theme
yay -S orchis-theme-git

# Set with gsettings
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"

# Or use lxappearance
lxappearance
```

**Add to Sway config**:
```bash
exec_always {
    gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-Dark'
    gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
    gsettings set org.gnome.desktop.interface font-name 'SF Pro Display 11'
}
```

### Qt Applications

```bash
# Install qt5ct and kvantum
sudo pacman -S qt5ct kvantum

# Set environment variable
export QT_QPA_PLATFORMTHEME=qt5ct

# Configure
qt5ct
kvantummanager
```

---

## Fonts

### Installed Fonts

```bash
# List installed fonts
fc-list | grep -i "nerd\|jetbrains"

# Common font directories
/usr/share/fonts/
~/.local/share/fonts/
```

### Installing New Fonts

```bash
# Install Nerd Fonts
yay -S ttf-jetbrains-mono-nerd
yay -S ttf-meslo-nerd
yay -S ttf-0xproto-nerd

# Install system fonts
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts
```

### Configuring Font in Applications

**Sway (for window titles)**:
```bash
font pango:JetBrains Mono Nerd Font 11
```

**Waybar**:
```css
* {
    font-family: "JetBrains Mono Nerd Font";
    font-size: 14px;
}
```

**Wezterm**:
```lua
config.font = wezterm.font('JetBrains Mono Nerd Font')
config.font_size = 12.0
```

**GTK**:
```bash
gsettings set org.gnome.desktop.interface font-name 'SF Pro Display 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrains Mono 10'
```

---

## Wallpapers

### Adding Wallpapers

```bash
# Copy wallpapers to backgrounds directory
cp ~/Downloads/wallpaper.jpg ~/.config/backgrounds/

# Or download directly
wget https://example.com/wallpaper.jpg -P ~/.config/backgrounds/
```

### Setting Wallpaper

```bash
# Using swww
swww img ~/.config/backgrounds/wallpaper.jpg

# Using background-swap script
~/.config/sway/scripts/background-swap.sh ~/.config/backgrounds/wallpaper.jpg

# Random wallpaper
~/.config/sway/scripts/background-swap.sh random
```

### Wallpaper Transitions

Edit wallpaper script to customize transitions:

```bash
#!/bin/bash
# In background-swap.sh

# Transition options
TRANSITION="fade"       # fade, wipe, grow, center
DURATION="2"            # seconds
FPS="60"

swww img "$WALLPAPER" \
    --transition-type "$TRANSITION" \
    --transition-duration "$DURATION" \
    --transition-fps "$FPS"
```

### Per-Monitor Wallpapers

```bash
# Set different wallpaper per output
swww img -o eDP-1 ~/.config/backgrounds/laptop.jpg
swww img -o HDMI-A-1 ~/.config/backgrounds/monitor.jpg
```

---

## Scripts Customization

### Modifying Existing Scripts

Example: Customize screenshot directory

```bash
# Edit screenshot.sh
chezmoi edit ~/.config/sway/scripts/executable_screenshot.sh

# Change SCREENSHOT_DIR variable
SCREENSHOT_DIR="$HOME/Pictures/MyScreenshots"
```

### Creating Custom Scripts

See [SCRIPTS.md](SCRIPTS.md#creating-custom-scripts) for detailed guide.

---

## Keybindings

### Adding Custom Keybindings

Edit [default-options-and-keymaps.conf](cachyos-sway-dotfiles-main/dot_config/sway/config.d/default-options-and-keymaps.conf):

```bash
# Example: Add keybinding for custom script
bindsym $mod+Ctrl+m exec ~/.config/sway/scripts/my-script.sh

# Open specific application
bindsym $mod+Shift+f exec firefox

# Move to scratchpad and show
bindsym $mod+u [app_id="dropdown"] scratchpad show

# Toggle between two workspaces
bindsym $mod+Tab workspace back_and_forth

# Cycle through workspaces
bindsym $mod+Ctrl+Right workspace next
bindsym $mod+Ctrl+Left workspace prev
```

### Modifying Existing Keybindings

```bash
# Change terminal keybinding
# Old: bindsym $mod+Return exec wezterm
bindsym $mod+Return exec alacritty

# Change launcher
# Old: bindsym $mod+d exec fuzzel
bindsym $mod+d exec wofi --show drun
```

See [KEYBINDINGS.md](KEYBINDINGS.md) for complete reference.

---

## Window Rules

### Floating Windows

```bash
# Make specific windows float
for_window [app_id="pavucontrol"] floating enable
for_window [app_id="blueman-manager"] floating enable
for_window [title="Picture-in-Picture"] floating enable

# Float all dialog windows
for_window [window_role="dialog"] floating enable
for_window [window_role="pop-up"] floating enable
```

### Window Sizing

```bash
# Set default size for floating windows
for_window [app_id="pavucontrol"] resize set 800 600
for_window [app_id="pavucontrol"] move position center
```

### Workspace Assignment

```bash
# Assign applications to specific workspaces
assign [app_id="firefox"] workspace 2
assign [app_id="code"] workspace 3
assign [class="discord"] workspace 4

# Move to workspace and focus
for_window [app_id="firefox"] workspace 2, focus
```

### Inhibit Idle

```bash
# Prevent idle for specific windows
for_window [app_id="mpv"] inhibit_idle focus
for_window [app_id="firefox" title=".*YouTube.*"] inhibit_idle fullscreen
```

### Border Rules

```bash
# No borders for specific windows
for_window [app_id="firefox"] border pixel 2
for_window [app_id="alacritty"] border pixel 1
for_window [app_id="mpv"] border none
```

### Finding Window Information

```bash
# Get window properties
swaymsg -t get_tree

# Get focused window info
swaymsg -t get_tree | jq '.. | select(.focused? == true)'
```

---

## Visual Effects

### SwayFX Configuration

```bash
# Corner radius
corner_radius 12

# Blur
blur enable
blur_xray off
blur_passes 2
blur_radius 5

# Shadows
shadows enable
shadows_on_csd enable
shadow_blur_radius 15
shadow_color #000000ee

# Dim unfocused windows
default_dim_inactive 0.1
dim_inactive_colors.unfocused #000000ff
dim_inactive_colors.urgent #ff0000ff

# Layer effects
layer_effects "waybar" {
    blur enable
    shadows enable
}

layer_effects "swaync" {
    blur enable
    blur_xray enable
    shadows enable
    corner_radius 10
}
```

### Transparency

```bash
# Window opacity
for_window [app_id="wezterm"] opacity 0.95
for_window [app_id="code"] opacity 0.98

# Application-specific
for_window [app_id="firefox"] opacity 1.0
```

---

## Advanced Customization

### Custom Modes

```bash
# Add a custom mode for media control
mode "media" {
    bindsym p exec playerctl play-pause
    bindsym n exec playerctl next
    bindsym Shift+n exec playerctl previous
    bindsym s exec playerctl stop
    
    # Return to default mode
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+m mode "media"
```

### Scratchpad Dropdown

```bash
# Create dropdown terminal
for_window [app_id="dropdown"] {
    floating enable
    resize set 1400 800
    move position center
    move scratchpad
}

# Launch dropdown on startup
exec wezterm --class dropdown

# Toggle with keybinding
bindsym $mod+grave [app_id="dropdown"] scratchpad show
```

### Workspace-specific Settings

```bash
# Workspace layouts
workspace 1 output eDP-1
workspace 2 output HDMI-A-1

# Workspace names with icons
set $ws1 "1:"
set $ws2 "2:"
set $ws3 "3:"
set $ws4 "4:"
set $ws5 "5:"

# Use named workspaces
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
```

---

## Backup & Restore

### Backup Configuration

```bash
# Backup chezmoi source
cd ~/.local/share/chezmoi
git add .
git commit -m "Backup $(date +%Y-%m-%d)"
git push
```

### Export Configuration

```bash
# Export as tarball
cd ~/.local/share/chezmoi
tar czf ~/dotfiles-backup-$(date +%Y%m%d).tar.gz .
```

### Restore Configuration

```bash
# Pull latest from git
cd ~/.local/share/chezmoi
git pull
chezmoi apply
```

---

## Tips & Best Practices

1. **Test before applying**: Use `chezmoi diff` to preview changes
2. **Small changes**: Make incremental modifications and test
3. **Backup first**: Commit changes to git before major modifications
4. **Document custom changes**: Add comments to configuration files
5. **Use includes**: Organize configs into separate files
6. **Check logs**: Monitor `journalctl` for errors after changes

---

## Resources

- [Sway Configuration Documentation](https://man.archlinux.org/man/sway.5)
- [Waybar Wiki](https://github.com/Alexays/Waybar/wiki)
- [Catppuccin Theme](https://github.com/catppuccin/catppuccin)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [chezmoi Documentation](https://www.chezmoi.io/)

For customization help, check [TROUBLESHOOTING.md](TROUBLESHOOTING.md) or [open an issue](https://github.com/Hype000798/cachyos-sway-dotfiles/issues).
