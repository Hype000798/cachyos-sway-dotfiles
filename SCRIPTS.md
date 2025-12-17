# Scripts Documentation

Comprehensive documentation for all custom scripts included in this dotfiles configuration.

## Table of Contents

- [Sway Scripts](#sway-scripts)
- [Waybar Scripts](#waybar-scripts)
- [Script Usage](#script-usage)
- [Creating Custom Scripts](#creating-custom-scripts)

## Sway Scripts

All Sway scripts are located in `~/.config/sway/scripts/`.

### System Management

#### `lockman.sh`
Manages screen locking functionality.

**Purpose**: Provides a wrapper for locking the screen with Hyprlock.

**Usage**:
```bash
~/.config/sway/scripts/lockman.sh
```

**Keybinding**: `Mod+Ctrl+l`

**Features**:
- Integrates with Hyprlock
- Can be triggered manually or by idle timeout
- Supports systemd integration

---

#### `powermenu.sh`
Interactive power management menu.

**Purpose**: Provides options for lock, logout, reboot, shutdown, and suspend.

**Usage**:
```bash
~/.config/sway/scripts/powermenu.sh
```

**Keybinding**: `Mod+Shift+d`

**Menu Options**:
- 🔒 Lock - Lock the screen
- 🚪 Logout - Exit Sway session
- 🔄 Reboot - Restart the system
- 🔌 Shutdown - Power off the system
- 💤 Suspend - Suspend to RAM

**Dependencies**:
- `fuzzel` - For menu display
- `systemctl` - For system operations

---

#### `swayidle_with_lid.sh`
Manages idle behavior and laptop lid events.

**Purpose**: Configures automatic screen locking and display management based on idle time and lid state.

**Usage**:
```bash
~/.config/sway/scripts/swayidle_with_lid.sh
```

**Auto-start**: Runs automatically on Sway startup

**Features**:
- Locks screen after configurable idle timeout
- Turns off display after extended idle
- Handles laptop lid close/open events
- Integrates with swaylock/hyprlock

---

#### `lid_watcher.sh`
Monitors laptop lid state.

**Purpose**: Watches for laptop lid events and triggers appropriate actions.

**Usage**:
```bash
~/.config/sway/scripts/lid_watcher.sh
```

**Auto-start**: Runs as background service

**Features**:
- Detects lid close/open events
- Triggers display power management
- Works with clamshell mode

---

#### `clamshell.sh`
Manages clamshell mode for laptops with external displays.

**Purpose**: Automatically disables laptop display when lid is closed and external monitor is connected.

**Usage**:
```bash
~/.config/sway/scripts/clamshell.sh
```

**Auto-start**: Runs on Sway startup

**Features**:
- Detects external displays
- Disables/enables internal display based on lid state
- Seamless transition between modes

---

### Visual Effects & Display

#### `swww_init.sh`
Initializes SWWW (Sway Wayland Wallpaper) daemon with advanced features.

**Purpose**: Sets up dynamic wallpaper management with transitions.

**Usage**:
```bash
~/.config/sway/scripts/swww_init.sh
```

**Auto-start**: Runs on Sway startup

**Features**:
- Starts SWWW daemon
- Loads initial wallpaper
- Configures transition effects
- Supports multi-monitor setups

---

#### `swww_init_simple.sh`
Simplified SWWW initialization.

**Purpose**: Basic wallpaper setup without advanced features.

**Usage**:
```bash
~/.config/sway/scripts/swww_init_simple.sh
```

**Auto-start**: Default initialization script

**Features**:
- Quick wallpaper loading
- Minimal configuration
- Suitable for low-resource systems

---

#### `background-swap.sh`
Manages wallpaper changes and selection.

**Purpose**: Changes wallpapers manually or randomly from a configured directory.

**Usage**:
```bash
# Random wallpaper
~/.config/sway/scripts/background-swap.sh random

# Next wallpaper in sequence
~/.config/sway/scripts/background-swap.sh

# Specific wallpaper
~/.config/sway/scripts/background-swap.sh /path/to/image.jpg
```

**Keybindings**:
- `Mod+Shift+w` - Random wallpaper
- `Mod+Alt+Shift+n` - Next wallpaper

**Features**:
- Random selection from backgrounds folder
- Sequential cycling
- Support for various image formats
- Smooth transitions with SWWW

**Configuration**:
- Wallpapers location: `~/.config/backgrounds/`
- Supported formats: jpg, png, webp

---

#### `swayfx_enhancements.sh`
Applies SwayFX visual enhancements.

**Purpose**: Configures SwayFX-specific features like blur, shadows, and rounded corners.

**Usage**:
```bash
~/.config/sway/scripts/swayfx_enhancements.sh
```

**Auto-start**: Runs on Sway startup

**Features**:
- Corner rounding
- Window blur effects
- Shadow effects
- Layer effects for specific windows

---

#### `swayfx_setup.sh`
Initial SwayFX configuration and setup.

**Purpose**: One-time setup script for SwayFX features.

**Usage**:
```bash
~/.config/sway/scripts/swayfx_setup.sh
```

**Features**:
- Verifies SwayFX installation
- Configures default visual settings
- Sets up compositor features

---

#### `auto-rotate.sh`
Automatic screen rotation based on device orientation.

**Purpose**: Rotates display automatically using accelerometer data (for tablets/convertibles).

**Usage**:
```bash
~/.config/sway/scripts/auto-rotate.sh
```

**Auto-start**: Optional, enable for 2-in-1 devices

**Features**:
- Reads accelerometer data
- Automatic orientation detection
- Smooth rotation transitions
- Input device rotation support

---

### Screenshots

#### `screenshot.sh`
Primary screenshot utility with multiple modes.

**Purpose**: Captures screenshots with various options and automatic saving/clipboard copying.

**Usage**:
```bash
# Full screen
~/.config/sway/scripts/screenshot.sh screen

# Selected area
~/.config/sway/scripts/screenshot.sh area

# Current window
~/.config/sway/scripts/screenshot.sh window
```

**Keybindings**:
- `Mod+Print` - Full screen
- `Mod+Ctrl+Print` - Area selection

**Features**:
- Multiple capture modes (screen, area, window)
- Automatic saving to `~/Pictures/Screenshots/`
- Automatic clipboard copying
- Timestamp-based filenames
- Notification on completion
- Proper cancellation handling

**Dependencies**:
- `grim` - Screenshot capture
- `slurp` - Area selection
- `wl-clipboard` - Clipboard support
- `swaync` - Notifications

---

#### `screenshot_fuzzy.sh`
Interactive screenshot menu using Fuzzel.

**Purpose**: Provides a user-friendly menu for various screenshot options.

**Usage**:
```bash
~/.config/sway/scripts/screenshot_fuzzy.sh
```

**Keybinding**: `Mod+Ctrl+s`

**Menu Options**:
- 📸 Full Screen
- 🖼️ Area Selection
- 🪟 Current Window
- ⏱️ Delayed (5s) Screenshot
- 📹 Screen Recording (toggle)

**Features**:
- Fuzzel integration for visual menu
- Calls screenshot.sh with appropriate parameters
- Visual feedback via notifications

---

#### `screenrecord.sh`
Screen recording utility.

**Purpose**: Records screen activity to video files.

**Usage**:
```bash
# Start recording
~/.config/sway/scripts/screenrecord.sh start

# Stop recording
~/.config/sway/scripts/screenrecord.sh stop

# Toggle recording
~/.config/sway/scripts/screenrecord.sh toggle
```

**Features**:
- Full screen or area recording
- Audio capture support
- MP4 output format
- Recording indicator
- Auto-save to `~/Videos/Recordings/`

**Dependencies**:
- `wf-recorder` - Screen recording
- `slurp` - Area selection (optional)

---

### Audio & Brightness

#### `volume_osd.sh`
Volume control with on-screen display.

**Purpose**: Manages audio volume with visual feedback.

**Usage**:
```bash
# Increase volume
~/.config/sway/scripts/volume_osd.sh up

# Decrease volume
~/.config/sway/scripts/volume_osd.sh down

# Toggle mute
~/.config/sway/scripts/volume_osd.sh mute
```

**Features**:
- SwayOSD integration
- Visual volume bar
- Mute indicator
- PipeWire/PulseAudio support

---

#### `brightness_osd.sh`
Screen brightness control with OSD.

**Purpose**: Adjusts screen brightness with visual feedback.

**Usage**:
```bash
# Increase brightness
~/.config/sway/scripts/brightness_osd.sh up

# Decrease brightness
~/.config/sway/scripts/brightness_osd.sh down
```

**Features**:
- SwayOSD integration
- Visual brightness bar
- Smooth transitions
- Multiple display support

**Dependencies**:
- `brightnessctl` - Brightness control

---

#### `light.sh`
Alternative brightness control utility.

**Purpose**: Manages backlight using the `light` utility.

**Usage**:
```bash
# Increase by 5%
~/.config/sway/scripts/light.sh up

# Decrease by 5%
~/.config/sway/scripts/light.sh down
```

**Dependencies**:
- `light` - Backlight control utility

---

### Utilities

#### `clipboard_history.sh`
Clipboard history manager.

**Purpose**: Displays and manages clipboard history using cliphist.

**Usage**:
```bash
~/.config/sway/scripts/clipboard_history.sh
```

**Keybinding**: `Mod+Shift+v`

**Features**:
- Stores clipboard history
- Fuzzel menu for selection
- Image and text support
- Persistent history across sessions

**Dependencies**:
- `cliphist` - Clipboard manager
- `wl-clipboard` - Wayland clipboard utilities
- `fuzzel` - Menu interface

---

#### `start_audio_services.sh`
Initializes audio services and configuration.

**Purpose**: Ensures PipeWire/WirePlumber services are running.

**Usage**:
```bash
~/.config/sway/scripts/start_audio_services.sh
```

**Auto-start**: Runs on Sway startup

**Features**:
- Starts PipeWire daemon
- Initializes WirePlumber
- Configures audio routing
- Sets default audio devices

---

#### `setup-mime-types.sh`
Configures default applications for file types.

**Purpose**: Sets up MIME type associations for XDG.

**Usage**:
```bash
~/.config/sway/scripts/setup-mime-types.sh
```

**Run**: Execute once after installation

**Features**:
- Configures default web browser
- Sets file manager associations
- Configures media player defaults
- Terminal emulator associations

---

## Waybar Scripts

All Waybar scripts are located in `~/.config/waybar/scripts/`.

These scripts provide dynamic information for Waybar modules:

### Common Waybar Scripts

#### `weather.sh`
Displays current weather information.

**Purpose**: Shows weather data in Waybar.

**Output**: Temperature and weather condition icon

**Dependencies**:
- `curl` - For API requests
- Weather API key (configure in script)

---

#### `updates.sh`
Checks for system updates.

**Purpose**: Displays number of available package updates.

**Output**: Number of pending updates

**Dependencies**:
- `checkupdates` - From pacman-contrib

---

#### `cpu_usage.sh`
Displays CPU usage percentage.

**Purpose**: Shows current CPU utilization.

**Output**: CPU usage percentage

---

#### `memory_usage.sh`
Displays memory usage information.

**Purpose**: Shows RAM utilization.

**Output**: Used/Total memory

---

## Script Usage

### Running Scripts Manually

```bash
# Make script executable (if needed)
chmod +x ~/.config/sway/scripts/script-name.sh

# Run the script
~/.config/sway/scripts/script-name.sh
```

### Debugging Scripts

Enable debug output:
```bash
# Add at the top of the script
set -x  # Print commands as they execute
set -e  # Exit on error
```

Check script errors:
```bash
# View Sway log
journalctl -xe --user -u sway.service

# Or check system log
tail -f ~/.local/share/sway/sway.log
```

### Script Locations

- **Sway scripts**: `~/.config/sway/scripts/`
- **Waybar scripts**: `~/.config/waybar/scripts/`
- **Source (chezmoi)**: `~/.local/share/chezmoi/dot_config/sway/scripts/`

## Creating Custom Scripts

### Template for New Scripts

```bash
#!/bin/bash
# Script Name: my-custom-script.sh
# Description: Brief description of what the script does
# Author: Your Name
# Date: YYYY-MM-DD

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_status() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Main function
main() {
    print_status "Starting script..."
    
    # Your code here
    
    print_success "Script completed."
}

# Run main function
main "$@"
```

### Best Practices

1. **Use shebang**: Always start with `#!/bin/bash`
2. **Error handling**: Use `set -e` to exit on errors
3. **Comments**: Document what the script does
4. **Functions**: Break complex logic into functions
5. **User feedback**: Use colored output for status messages
6. **Dependencies check**: Verify required commands are available

Example dependency check:
```bash
check_dependencies() {
    local deps=("grim" "slurp" "wl-copy")
    for cmd in "${deps[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            print_error "$cmd is not installed"
            exit 1
        fi
    done
}
```

### Adding Scripts to Keybindings

1. Create your script in `~/.config/sway/scripts/`
2. Make it executable: `chmod +x script-name.sh`
3. Add keybinding in `~/.config/sway/config.d/default-options-and-keymaps.conf`:
```
bindsym $mod+key exec ~/.config/sway/scripts/script-name.sh
```
4. Reload Sway: `Mod+Shift+c`

### Using Scripts in Waybar

Add to `~/.config/waybar/config.jsonc`:
```json
"custom/module-name": {
    "exec": "~/.config/waybar/scripts/script-name.sh",
    "interval": 60,
    "format": "{}",
    "tooltip": false
}
```

## Troubleshooting

### Script Not Executing

1. Check permissions: `ls -l ~/.config/sway/scripts/script-name.sh`
2. Make executable: `chmod +x script-name.sh`
3. Verify shebang: First line should be `#!/bin/bash`

### Dependency Issues

```bash
# Check if command is available
command -v grim &> /dev/null || echo "grim not found"

# Install missing dependencies
yay -S package-name
```

### Script Errors

View logs:
```bash
# Run script directly to see errors
~/.config/sway/scripts/script-name.sh

# Check Sway log
journalctl --user -u sway --since today
```

## Additional Resources

- [Bash Scripting Guide](https://www.gnu.org/software/bash/manual/)
- [ShellCheck](https://www.shellcheck.net/) - Script linting tool
- [Sway IPC](https://man.archlinux.org/man/sway-ipc.7.en.html) - For advanced Sway integration

---

For script-related issues or feature requests, please [open an issue](https://github.com/Hype000798/cachyos-sway-dotfiles/issues).
