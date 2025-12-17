# Keybindings Reference

Complete reference of all keyboard shortcuts and keybindings configured in this Sway setup.

> **Note**: `Mod` refers to the Super/Windows key (`Mod4`). All keybindings are customizable in [default-options-and-keymaps.conf](cachyos-sway-dotfiles-main/dot_config/sway/config.d/default-options-and-keymaps.conf).

## Table of Contents

- [Basic Controls](#basic-controls)
- [Window Management](#window-management)
- [Workspace Management](#workspace-management)
- [Application Launchers](#application-launchers)
- [Screenshots](#screenshots)
- [System Controls](#system-controls)
- [Audio & Brightness](#audio--brightness)
- [Display Controls](#display-controls)
- [Utilities](#utilities)
- [Resize Mode](#resize-mode)

## Basic Controls

### Core Actions

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+Return` | Launch Terminal | Opens Wezterm terminal |
| `Mod+Shift+q` | Kill Window | Closes the focused window |
| `Mod+d` | Application Launcher | Opens Fuzzel launcher |
| `Mod+Shift+d` | Power Menu | Opens power menu (lock/logout/reboot/shutdown) |
| `Mod+Shift+c` | Reload Config | Reloads Sway configuration |
| `Mod+Shift+e` | Exit Sway | Shows confirmation dialog to exit Sway |

### Scratchpad

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+Shift+minus` | Move to Scratchpad | Moves focused window to scratchpad |
| `Mod+minus` | Toggle Scratchpad | Shows/hides scratchpad windows |

## Window Management

### Focus Navigation

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+h` | Focus Left | Moves focus to left window |
| `Mod+j` | Focus Down | Moves focus to window below |
| `Mod+k` | Focus Up | Moves focus to window above |
| `Mod+l` | Focus Right | Moves focus to right window |
| `Mod+Left` | Focus Left | Moves focus to left window (arrow key) |
| `Mod+Down` | Focus Down | Moves focus to window below (arrow key) |
| `Mod+Up` | Focus Up | Moves focus to window above (arrow key) |
| `Mod+Right` | Focus Right | Moves focus to right window (arrow key) |
| `Mod+a` | Focus Parent | Moves focus to parent container |

### Window Movement

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+Shift+h` | Move Left | Moves window left |
| `Mod+Shift+j` | Move Down | Moves window down |
| `Mod+Shift+k` | Move Up | Moves window up |
| `Mod+Shift+l` | Move Right | Moves window right |
| `Mod+Shift+Left` | Move Left | Moves window left (arrow key) |
| `Mod+Shift+Down` | Move Down | Moves window down (arrow key) |
| `Mod+Shift+Up` | Move Up | Moves window up (arrow key) |
| `Mod+Shift+Right` | Move Right | Moves window right (arrow key) |

### Window Layout

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+b` | Horizontal Split | Splits container horizontally |
| `Mod+v` | Vertical Split | Splits container vertically |
| `Mod+s` | Stacking Layout | Changes to stacking layout |
| `Mod+w` | Tabbed Layout | Changes to tabbed layout |
| `Mod+e` | Toggle Split | Toggles between split layouts |
| `Mod+f` | Fullscreen | Toggles fullscreen for focused window |
| `Mod+Shift+space` | Toggle Floating | Toggles between tiling and floating |
| `Mod+space` | Toggle Focus Mode | Swaps focus between tiling and floating areas |
| `Mod+Mouse1` | Drag Floating | Drag floating windows (hold Mod + left click) |

## Workspace Management

### Switching Workspaces

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+1` | Workspace 1 | Switches to workspace 1 |
| `Mod+2` | Workspace 2 | Switches to workspace 2 |
| `Mod+3` | Workspace 3 | Switches to workspace 3 |
| `Mod+4` | Workspace 4 | Switches to workspace 4 |
| `Mod+5` | Workspace 5 | Switches to workspace 5 |
| `Mod+6` | Workspace 6 | Switches to workspace 6 |
| `Mod+7` | Workspace 7 | Switches to workspace 7 |
| `Mod+8` | Workspace 8 | Switches to workspace 8 |
| `Mod+9` | Workspace 9 | Switches to workspace 9 |
| `Mod+0` | Workspace 10 | Switches to workspace 10 |

### Moving Windows to Workspaces

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+Shift+1` | Move to Workspace 1 | Moves focused window to workspace 1 |
| `Mod+Shift+2` | Move to Workspace 2 | Moves focused window to workspace 2 |
| `Mod+Shift+3` | Move to Workspace 3 | Moves focused window to workspace 3 |
| `Mod+Shift+4` | Move to Workspace 4 | Moves focused window to workspace 4 |
| `Mod+Shift+5` | Move to Workspace 5 | Moves focused window to workspace 5 |
| `Mod+Shift+6` | Move to Workspace 6 | Moves focused window to workspace 6 |
| `Mod+Shift+7` | Move to Workspace 7 | Moves focused window to workspace 7 |
| `Mod+Shift+8` | Move to Workspace 8 | Moves focused window to workspace 8 |
| `Mod+Shift+9` | Move to Workspace 9 | Moves focused window to workspace 9 |
| `Mod+Shift+0` | Move to Workspace 10 | Moves focused window to workspace 10 |

## Application Launchers

### Quick Access

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+n` | File Manager | Opens Nemo file manager |
| `Mod+o` | Browser | Opens Brave browser |
| `Mod+Shift+t` | New Terminal | Opens new Wezterm instance |
| `Mod+Ctrl+b` | Browser | Opens Brave browser |
| `Mod+Ctrl+Return` | Terminal (New Class) | Opens Wezterm with new_terminal class |
| `Mod+Ctrl+o` | Browser New Window | Opens Brave in new window |
| `Mod+Ctrl+Shift+t` | Terminal (Wide Tabs) | Opens Wezterm with wide tabs |
| `Mod+Ctrl+Shift+b` | Browser Incognito | Opens Brave in incognito mode |

## Screenshots

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+Print` | Full Screenshot | Captures full screen (saved & copied to clipboard) |
| `Mod+Ctrl+Print` | Area Screenshot | Select area to capture (saved & copied to clipboard) |
| `Mod+Ctrl+s` | Screenshot Menu | Opens Fuzzel menu for screenshot options |
| `Print` | Full Screenshot | Captures full screen (alternative) |

> Screenshots are saved to `~/Pictures/Screenshots/` and automatically copied to clipboard.

## System Controls

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+Ctrl+l` | Lock Screen | Locks the screen using Hyprlock |
| `Mod+Shift+n` | Notification Center | Toggles SwayNC notification center |
| `Mod+Shift+v` | Clipboard History | Opens clipboard history with cliphist |
| `Mod+Ctrl+w` | Network Manager | Opens NetworkManager dmenu |

## Audio & Brightness

### Volume Control

| Keybinding | Action | Description |
|------------|--------|-------------|
| `XF86AudioRaiseVolume` | Volume Up | Increases volume (with OSD) |
| `XF86AudioLowerVolume` | Volume Down | Decreases volume (with OSD) |
| `XF86AudioMute` | Toggle Mute | Mutes/unmutes audio (with OSD) |

> Uses SwayOSD for on-screen display feedback.

### Brightness Control

| Keybinding | Action | Description |
|------------|--------|-------------|
| `XF86MonBrightnessUp` | Brightness Up | Increases screen brightness (with OSD) |
| `XF86MonBrightnessDown` | Brightness Down | Decreases screen brightness (with OSD) |

## Display Controls

### Screen Rotation

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+F9` | Rotate Normal | Sets display to normal orientation (0°) |
| `Mod+Ctrl+F9` | Rotate Right | Rotates display 90° clockwise |
| `Mod+Shift+F9` | Rotate Inverted | Rotates display 180° (upside down) |

> These controls are for the eDP-1 display (typically laptop screens).

## Utilities

### Background Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Mod+Shift+w` | Random Wallpaper | Sets a random wallpaper from backgrounds folder |
| `Mod+Alt+Shift+n` | Next Wallpaper | Cycles to the next wallpaper |

## Resize Mode

Press `Mod+r` to enter resize mode, then use the following keys:

| Keybinding | Action | Description |
|------------|--------|-------------|
| `h` / `Left` | Shrink Width | Decreases container width |
| `j` / `Down` | Grow Height | Increases container height |
| `k` / `Up` | Shrink Height | Decreases container height |
| `l` / `Right` | Grow Width | Increases container width |
| `Return` / `Escape` / `Mod+r` | Exit Resize | Returns to normal mode |

## Customization

### Modifying Keybindings

To customize keybindings:

1. Edit the configuration file:
   ```bash
   chezmoi edit ~/.local/share/chezmoi/dot_config/sway/config.d/default-options-and-keymaps.conf
   ```

2. Apply changes:
   ```bash
   chezmoi apply
   ```

3. Reload Sway:
   ```bash
   swaymsg reload
   # or press Mod+Shift+c
   ```

### Keybinding Format

Sway keybindings follow this format:
```
bindsym $mod+key exec command
```

**Modifiers**:
- `Mod4` (Super/Windows key) - default `$mod`
- `Shift` - Shift key
- `Control` / `Ctrl` - Control key
- `Mod1` / `Alt` - Alt key

**Examples**:
```
bindsym $mod+Return exec wezterm
bindsym $mod+Shift+q kill
bindsym $mod+Ctrl+l exec ~/.config/sway/scripts/lockman.sh
```

## Tips

- **Chaining Commands**: Hold `Mod` and press multiple keys in sequence for complex actions
- **Learning Curve**: Print this reference or keep it handy while learning
- **Visual Feedback**: Most actions provide visual feedback through notifications or OSD
- **Testing Changes**: Use `swaymsg -t get_binding_modes` to verify binding modes
- **Debugging**: Use `swaymsg -t get_inputs` to check input device configuration

## Additional Resources

- [Sway Official Wiki](https://github.com/swaywm/sway/wiki)
- [Sway Keybinding Documentation](https://man.archlinux.org/man/sway.5#COMMANDS)
- [Configuration Details](README.md#configuration-details)

---

For issues or suggestions regarding keybindings, please [open an issue](https://github.com/Hype000798/cachyos-sway-dotfiles/issues).
