# CachyOS Sway Dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Stars](https://img.shields.io/github/stars/ankitjd7795/cachyos-sway-dotfiles?style=social)](https://github.com/ankitjd7795/cachyos-sway-dotfiles)
[![Forks](https://img.shields.io/github/forks/ankitjd7795/cachyos-sway-dotfiles?style=social)](https://github.com/ankitjd7795/cachyos-sway-dotfiles/fork)
[![Issues](https://img.shields.io/github/issues/ankitjd7795/cachyos-sway-dotfiles)](https://github.com/ankitjd7795/cachyos-sway-dotfiles/issues)

A collection of meticulously crafted dotfiles for a beautiful and functional Sway Wayland compositor setup on CachyOS, managed with `chezmoi`.

> ⭐ If you find this project useful, consider giving it a star!

## Quick Start

```bash
# One-line installation
chezmoi init --apply https://github.com/ankitjd7795/cachyos-sway-dotfiles.git && ~/.local/share/chezmoi/executable_arch-setup-script.sh
```

## Screenshots

> **Note**: Add screenshots of your setup here! You can upload images to your repo under a `screenshots/` directory or use GitHub's issue/PR upload feature to get image URLs.

<!-- Example:
![Desktop](screenshots/desktop.png)
![Waybar](screenshots/waybar.png)
![Fuzzel](screenshots/fuzzel.png)
-->

## Table of Contents

- [Quick Start](#quick-start)
- [Screenshots](#screenshots)
- [Project Description](#project-description)
- [Key Features](#key-features)
- [Installation](#installation)
- [Quick Start / Usage](#quick-start--usage)
- [Keybindings Reference](#keybindings-reference)
- [Configuration Details](#configuration-details)
- [Customization Guide](#customization-guide)
- [Scripts Documentation](#scripts-documentation)
- [Package List](#package-list)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Development Workflow](#development-workflow)
- [Roadmap](#roadmap)
- [Changelog](#changelog)
- [Security Policy](#security-policy)
- [License](#license)
- [Authors & Acknowledgments](#authors--acknowledgments)
- [Support & Contact](#support--contact)

## Project Description

This project provides a complete set of personalized configuration files (dotfiles) designed to enhance the user experience of the Sway Wayland compositor on CachyOS. It aims to offer a visually appealing, highly efficient, and well-organized desktop environment out-of-the-box, using `chezmoi` for seamless management across machines.

These dotfiles are specifically tailored for CachyOS, ensuring compatibility and leveraging its strengths. They focus on a clean, minimalist design while providing robust functionality, making them ideal for both new Sway users and seasoned enthusiasts looking for a fresh setup.

## Key Features

*   **Sway Configuration:** Optimized keybindings, workspaces, and window management rules, including `swayfx` for visual enhancements.
*   **Bar Integration:** A sleek and informative `Waybar` configuration for system status, notifications, and quick access.
*   **Launcher:** Efficient application launching and menu navigation with `Fuzzel`.
*   **Lock Screen:** Secure and stylish screen locking with `Hyprlock`.
*   **Terminal Emulator:** Feature-rich `Wezterm` configuration.
*   **File Manager:** Modern and efficient `Yazi` terminal file manager.
*   **Robust Automated Setup Script (`arch-setup-script.sh`):** This script streamlines installation by:
    *   Adding CachyOS repositories.
    *   Reinstalling native packages to apply CachyOS optimizations.
    *   Installing `yay` and `paru` (AUR helpers) directly from CachyOS repositories.
    *   Intelligently handling the `sway` vs. `swayfx` conflict to ensure `swayfx` is installed.
    *   Installing all user-defined packages from the comprehensive list.
*   **Themed Applications:** Cohesive theming across various applications for a unified look and feel (e.g., Catppuccin Mocha, Orchis GTK Theme).
*   **Background Management:** Dynamic background changes with `swww`.
*   **Clipboard Management:** History and pasting with `wl-clipboard` and `cliphist`.
*   **Custom Scripts:** Various utility scripts for power menu, screenshots (with save-to-file and clipboard functionality, and proper cancellation handling), volume/brightness OSD, and more.

## Installation

These dotfiles are managed using `chezmoi` and can be easily installed on any CachyOS or Arch-based system.

### Prerequisites

Before installing these dotfiles, ensure you have the following installed on your CachyOS system:

*   **`chezmoi`**: Install via your package manager (e.g., `sudo pacman -S chezmoi`).
*   **Git**: For cloning the repository.

### Recommended Installation (Automated with Setup Script)

This method automates the setup process, including comprehensive package installation via the provided script.

1.  **Initialize `chezmoi`:** This command will clone the repository to `~/.local/share/chezmoi` and apply the dotfiles to your system.
    ```bash
    chezmoi init --apply https://github.com/ankitjd7795/cachyos-sway-dotfiles.git
    ```
2.  **Run the Setup Script:** The `executable_arch-setup-script.sh` is now available locally in your `chezmoi` source directory (e.g., `~/.local/share/chezmoi/executable_arch-setup-script.sh`). Execute it to install system packages and configure CachyOS repositories:
    ```bash
    ~/.local/share/chezmoi/executable_arch-setup-script.sh
    ```
    This script will guide you through adding CachyOS repos, updating package databases, and installing all recommended packages for this dotfile setup, including correctly handling `sway` vs `swayfx` installation.

### Manual Installation (Advanced)

If you prefer a more granular setup or need to inspect each step:

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/ankitjd7795/cachyos-sway-dotfiles.git ~/.local/share/chezmoi
    cd ~/.local/share/chezmoi
    ```
2.  **Install Prerequisites:** Manually install all necessary software (Sway, Waybar, Fuzzel, Hyprlock, Wezterm, etc.) using your package manager. You can refer to `~/.local/share/chezmoi/executable_arch-setup-script.sh` for a comprehensive list of recommended packages.
3.  **Apply Dotfiles:**
    ```bash
    chezmoi apply
    ```

### Verification Steps

After installation, log out and log back into your Sway session. You should see the new configuration applied. Check Waybar, Fuzzel, Hyprlock, and your terminal (Wezterm) to ensure they reflect the new themes and settings.

## Quick Start / Usage

Once installed, your Sway environment will be transformed. Here are some common interactions:

*   **Application Launcher (Fuzzel):** `Mod + d` (or `Super + d`)
*   **Terminal (Wezterm):** `Mod + Return`
*   **Close Focused Window:** `Mod + Shift + q`
*   **Lock Screen (Hyprlock):** `Mod + Shift + l`
*   **Exit Sway:** `Mod + Shift + e`
*   **Reload Sway Config:** `Mod + Shift + c`
*   **Change Workspace:** `Mod + [1-9]`
*   **Move Window to Workspace:** `Mod + Shift + [1-9]`
*   **Screenshots:**
    *   `Print Screen`: Full screen screenshot (saved and copied to clipboard).
    *   `Mod+PrtSc`: Full screen screenshot (saved and copied to clipboard).
    *   `Mod+Ctrl+PrtSc`: Area screenshot (saved and copied to clipboard).
    *   `Mod+Ctrl+s`: Fuzzel menu for various screenshot options.
*   **Power Menu:** `Mod+Shift+d` (Launches Fuzzel power menu for lock/logout/reboot/shutdown).
*   **Clipboard History:** `Mod+Shift+v`

Explore `~/.config/sway/config` for a full list of keybindings.

---

## Keybindings Reference

> **Note**: `Mod` refers to the Super/Windows key (`Mod4`).

### Basic Controls

| Keybinding | Action |
|------------|--------|
| `Mod+Return` | Launch Terminal (Wezterm) |
| `Mod+d` | Application Launcher (Fuzzel) |
| `Mod+Shift+q` | Kill Window |
| `Mod+Shift+d` | Power Menu |
| `Mod+Shift+c` | Reload Config |
| `Mod+Shift+e` | Exit Sway |
| `Mod+Ctrl+l` | Lock Screen |

### Window Management

| Keybinding | Action |
|------------|--------|
| `Mod+h/j/k/l` | Focus Left/Down/Up/Right |
| `Mod+Shift+h/j/k/l` | Move Window Left/Down/Up/Right |
| `Mod+b` | Horizontal Split |
| `Mod+s` | Stacking Layout |
| `Mod+w` | Tabbed Layout |
| `Mod+e` | Toggle Split |
| `Mod+f` | Fullscreen |
| `Mod+Shift+space` | Toggle Floating |
| `Mod+r` | Resize Mode |

### Workspaces

| Keybinding | Action |
|------------|--------|
| `Mod+1-0` | Switch to Workspace 1-10 |
| `Mod+Shift+1-0` | Move Window to Workspace 1-10 |

### Screenshots

| Keybinding | Action |
|------------|--------|
| `Mod+Print` | Full Screenshot |
| `Mod+Ctrl+Print` | Area Screenshot |
| `Mod+Ctrl+s` | Screenshot Menu |

### Quick Access

| Keybinding | Action |
|------------|--------|
| `Mod+n` | File Manager (Nemo) |
| `Mod+o` | Browser (Brave) |
| `Mod+Shift+v` | Clipboard History |
| `Mod+Shift+n` | Notification Center |
| `Mod+Ctrl+w` | Network Manager |

### Media Keys

| Keybinding | Action |
|------------|--------|
| `XF86AudioRaiseVolume` | Volume Up |
| `XF86AudioLowerVolume` | Volume Down |
| `XF86AudioMute` | Toggle Mute |
| `XF86MonBrightnessUp` | Brightness Up |
| `XF86MonBrightnessDown` | Brightness Down |

### Wallpaper

| Keybinding | Action |
|------------|--------|
| `Mod+Shift+w` | Random Wallpaper |
| `Mod+Alt+Shift+n` | Next Wallpaper |

---

## Configuration Details

The core configurations are located in your `chezmoi` source directory (typically `~/.local/share/chezmoi/`) and deployed to your `~/.config/` directory.

*   **Sway:** `~/.config/sway/config` - Main Sway configuration, keybindings, and output settings.
*   **Waybar:** `~/.config/waybar/config.jsonc` and `~/.config/waybar/style.css` - Bar layout, modules, and styling.
*   **Fuzzel:** `~/.config/fuzzel/fuzzel.ini` - Application launcher configuration.
*   **Hyprlock:** `~/.config/hypr/hyprlock.conf` - Lock screen configuration.
*   **Wezterm:** `~/.config/wezterm/wezterm.lua` - Terminal emulator settings.
*   **Yazi:** `~/.config/yazi/` - Terminal file manager configuration.
*   **Backgrounds:** `~/.config/backgrounds/` - Image files used for wallpapers.

Feel free to modify these files directly in your `chezmoi` source (`~/.local/share/chezmoi/dot_config/`) and then run `chezmoi apply` to deploy changes. Remember to reload Sway (`Mod + Shift + c`) after making changes to the Sway configuration.

---

## Customization Guide

### Color Schemes & Themes

The default setup uses **Catppuccin Mocha** color palette. To change themes:

1. Edit color configuration:
   ```bash
   chezmoi edit ~/.config/sway/config.d/00-colors.conf
   ```

2. Update Waybar colors in `~/.config/waybar/style.css`

3. Apply changes:
   ```bash
   chezmoi apply
   swaymsg reload
   ```

### Sway Configuration

**Window Behavior**:
```bash
# In default-options-and-keymaps.conf
default_border pixel 2
focus_follows_mouse yes
workspace_auto_back_and_forth yes
```

**Gaps**:
```bash
gaps inner 10
gaps outer 5
smart_gaps on
```

**Output Configuration**:
```bash
# Find output names
swaymsg -t get_outputs

# Configure in outputs.conf
output eDP-1 resolution 1920x1080 position 0,0 scale 1
```

**Input Devices**:
```bash
# In inputs.conf
input type:touchpad {
    tap enabled
    natural_scroll enabled
    dwt enabled
}

input type:keyboard {
    xkb_layout "us"
    xkb_options "caps:escape"
}
```

### Waybar Customization

Edit `~/.config/waybar/config.jsonc` for layout and modules:

```json
{
    "modules-left": ["clock", "cpu", "memory"],
    "modules-center": ["sway/workspaces"],
    "modules-right": ["tray", "pulseaudio", "network", "battery"]
}
```

Edit `~/.config/waybar/style.css` for styling:

```css
window#waybar {
    background-color: rgba(30, 30, 46, 0.8);
    border-radius: 12px;
}

#clock {
    background-color: #89b4fa;
    color: #1e1e2e;
    padding: 0 15px;
}
```

### Application Themes

**Terminal (Wezterm)**:
```lua
-- In ~/.config/wezterm/wezterm.lua
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('JetBrains Mono Nerd Font')
config.font_size = 12.0
config.window_background_opacity = 0.95
```

**Fuzzel Launcher**:
```ini
# In ~/.config/fuzzel/fuzzel.ini
[main]
font=JetBrains Mono Nerd Font:size=12
[colors]
background=1e1e2eee
text=cdd6f4ff
match=89b4faff
```

**GTK Applications**:
```bash
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
lxappearance  # GUI theme manager
```

### Fonts

Installed Nerd Fonts:
- JetBrains Mono Nerd Font (primary)
- Meslo Nerd Font
- 0xProto Nerd Font

Install additional fonts:
```bash
yay -S ttf-font-name
fc-cache -fv  # Refresh font cache
```

### Wallpapers

**Add wallpapers**:
```bash
cp ~/Downloads/wallpaper.jpg ~/.config/backgrounds/
```

**Set wallpaper**:
```bash
swww img ~/.config/backgrounds/wallpaper.jpg
~/.config/sway/scripts/background-swap.sh random
```

**Per-monitor wallpapers**:
```bash
swww img -o eDP-1 ~/.config/backgrounds/laptop.jpg
swww img -o HDMI-A-1 ~/.config/backgrounds/monitor.jpg
```

### Window Rules

```bash
# Floating windows
for_window [app_id="pavucontrol"] floating enable
for_window [window_role="dialog"] floating enable

# Workspace assignment
assign [app_id="firefox"] workspace 2
assign [app_id="code"] workspace 3

# Inhibit idle
for_window [app_id="mpv"] inhibit_idle focus

# Borders
for_window [app_id="firefox"] border pixel 2
```

### Visual Effects (SwayFX)

```bash
# In Sway config
corner_radius 12
blur enable
blur_passes 2
shadows enable

# Layer effects
layer_effects "waybar" {
    blur enable
    shadows enable
}

# Window opacity
for_window [app_id="wezterm"] opacity 0.95
```

---

## Scripts Documentation

All custom scripts are located in `~/.config/sway/scripts/`.

### System Management Scripts

**lockman.sh** - Screen locking wrapper for Hyprlock  
**powermenu.sh** - Power menu (lock/logout/reboot/shutdown)  
**swayidle_with_lid.sh** - Idle management and lid handling  
**clamshell.sh** - Clamshell mode for external monitors

### Visual Effects Scripts

**swww_init_simple.sh** - Initialize wallpaper daemon  
**background-swap.sh** - Change wallpapers  
**swayfx_enhancements.sh** - Apply SwayFX visual effects  
**auto-rotate.sh** - Automatic screen rotation (tablets)

### Screenshot Scripts

**screenshot.sh** - Main screenshot utility
```bash
# Usage
~/.config/sway/scripts/screenshot.sh screen  # Full screen
~/.config/sway/scripts/screenshot.sh area   # Area selection
~/.config/sway/scripts/screenshot.sh window # Current window
```

**screenshot_fuzzy.sh** - Interactive screenshot menu  
**screenrecord.sh** - Screen recording utility

### Audio & Brightness Scripts

**volume_osd.sh** - Volume control with OSD  
**brightness_osd.sh** - Brightness control with OSD  
**start_audio_services.sh** - Initialize PipeWire/WirePlumber

### Utility Scripts

**clipboard_history.sh** - Clipboard history manager  
**setup-mime-types.sh** - Configure default applications  
**lid_watcher.sh** - Monitor laptop lid events

### Creating Custom Scripts

Template for new scripts:

```bash
#!/bin/bash
set -e  # Exit on error

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

print_status() { echo -e "${GREEN}[INFO]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

main() {
    print_status "Starting script..."
    # Your code here
}

main "$@"
```

**Add to keybindings**:
```bash
# In default-options-and-keymaps.conf
bindsym $mod+key exec ~/.config/sway/scripts/my-script.sh
```

---

## Package List

### Essential Categories

**Window Manager & Wayland** (15 packages, ~15 MB):
- swayfx, swayidle, waybar, swww, fuzzel, grim, slurp, wl-clipboard, cliphist, swaync, swayosd, autotiling-rs

**Terminal Applications** (8 packages, ~60 MB):
- wezterm, alacritty, foot, bat, eza, zsh, oh-my-posh, yazi

**Desktop Applications** (9 packages, ~900 MB):
- brave-bin, firefox, nemo (with plugins), visual-studio-code-bin, zed

**Audio System** (8 packages, ~5 MB):
- pipewire, pipewire-alsa, pipewire-pulse, pipewire-jack, wireplumber, pavucontrol

**System Utilities** (24 packages, ~30 MB):
- networkmanager, blueman, bluez, brightnessctl, htop, timeshift, reflector, snapper

**Theming & Fonts** (16 packages, ~400 MB):
- Nerd Fonts (jetbrains-mono, meslo, 0xproto)
- papirus-icon-theme, orchis-theme
- lxappearance, qt5ct, kvantum

**Development Tools** (6 packages, ~300 MB):
- rustup, rust-analyzer, go, python, nodejs, npm, github-cli

**Graphics & Drivers** (12 packages, ~110 MB):
- mesa, vulkan-radeon, vulkan-intel, libva-mesa-driver, intel-media-driver

**Gaming** (5 packages, ~500 MB):
- gamemode, gamescope, steam, wine, protonup-qt

**Communication** (4 packages, ~330 MB):
- discord, vesktop, telegram-desktop, ayugram-desktop

### Total: 126+ packages, ~3.6 GB

### Install Commands

```bash
# Run setup script (installs all packages)
~/.local/share/chezmoi/executable_arch-setup-script.sh

# Install individual package
sudo pacman -S package-name  # Official repos
yay -S package-name          # AUR

# Remove package
sudo pacman -Rs package-name

# Check package info
pacman -Qi package-name
```

---

## Troubleshooting

### Common Issues

**Sway Won't Start**:
```bash
# Check for config errors
sway -C ~/.config/sway/config

# View logs
journalctl --user -xe | grep sway

# Start with debug output
sway -d 2>&1 | tee ~/sway-debug.log
```

**SwayFX Features Not Working**:
```bash
# Verify SwayFX is installed (not regular Sway)
sway --version

# If regular Sway is installed
sudo pacman -Rdd sway
sudo pacman -S swayfx
```

**Wallpaper Not Loading**:
```bash
# Check SWWW daemon
pgrep swww-daemon

# Restart daemon
swww kill
swww init
swww img ~/.config/backgrounds/your-image.jpg
```

**No Sound**:
```bash
# Check PipeWire services
systemctl --user status pipewire pipewire-pulse wireplumber

# Start services
systemctl --user start pipewire pipewire-pulse wireplumber

# Run audio setup script
~/.config/sway/scripts/start_audio_services.sh
```

**Volume/Brightness Keys Not Working**:
```bash
# Check keybindings
grep XF86Audio ~/.config/sway/config.d/default-options-and-keymaps.conf

# Test SwayOSD
swayosd-client --output-volume raise
```

**Multiple Monitor Issues**:
```bash
# List outputs
swaymsg -t get_outputs

# Configure in outputs.conf
output HDMI-A-1 resolution 1920x1080 position 1920,0
swaymsg reload
```

**Application Launcher Issues**:
```bash
# Test Fuzzel
fuzzel

# Check configuration
cat ~/.config/fuzzel/fuzzel.ini

# Use alternative launcher
wofi --show drun
```

**High CPU Usage**:
```bash
# Check processes
htop

# Disable visual effects temporarily
# Comment out in config: blur enable, shadows enable

# Reduce Waybar update frequency
# Increase "interval" values in config.jsonc
```

### Debugging Tools

```bash
# Sway information
swaymsg -t get_version
swaymsg -t get_config
swaymsg -t get_outputs
swaymsg -t get_inputs

# System logs
journalctl --user -xe
dmesg | tail

# Check package status
pacman -Q | grep sway
```

---

## Contributing

Thank you for considering contributing to this project!

### Getting Started

1. Fork the repository on GitHub
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/cachyos-sway-dotfiles.git ~/.local/share/chezmoi
   cd ~/.local/share/chezmoi
   ```
3. Add upstream:
   ```bash
   git remote add upstream https://github.com/ankitjd7795/cachyos-sway-dotfiles.git
   ```

### Development Workflow

1. **Create a branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make changes** and test:
   ```bash
   chezmoi apply
   swaymsg reload
   ```

3. **Test scripts**:
   ```bash
   shellcheck ~/.local/share/chezmoi/dot_config/sway/scripts/executable_your-script.sh
   ```

4. **Commit changes**:
   ```bash
   git add .
   git commit -m "feat(sway): add new feature"
   ```

5. **Push and create PR**:
   ```bash
   git push origin feature/your-feature-name
   ```

### Commit Message Format

```
type(scope): brief description

Detailed explanation if necessary
```

**Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`

**Examples**:
```
feat(sway): add new keybinding for window splitting
fix(scripts): correct screenshot path handling
docs(readme): update installation instructions
```

### Style Guidelines

**Shell Scripts**:
- Use `#!/bin/bash` shebang
- Include error handling (`set -e`)
- Use meaningful variable names in `UPPER_CASE`
- Add comments for complex logic
- Use functions for reusable code

**Configuration Files**:
- Follow official syntax for each format
- Use consistent indentation (4 spaces for JSON/CSS, 2 for YAML)
- Add comments explaining non-obvious settings

### Reporting Issues

Include in your issue:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- System information (OS, Sway version)
- Relevant logs or error messages
- Screenshots if applicable

---

## Development Workflow

These dotfiles are managed using Git via `chezmoi`. To contribute or make personal changes:

1.  **Edit Files:** Make your changes directly in your `chezmoi` source directory (e.g., `~/.local/share/chezmoi/dot_config/sway/config`).
2.  **Apply Changes:** Run `chezmoi apply` to deploy them to your system.
3.  **Test Changes:** Reload Sway or the specific application.
4.  **Stage & Commit:** Navigate to your `chezmoi` source directory (`cd ~/.local/share/chezmoi`), then use `git add .` and `git commit -m "Your descriptive message"`.
5.  **Push to Remote:** `git push` to share your changes.

## Roadmap

*   Further refine Waybar modules and styling.
*   Integrate additional useful utilities and their configurations.
*   Automate post-install configurations where possible.
*   Expand theming options.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for release notes and version history.

## Security Policy

See [SECURITY.md](SECURITY.md) for vulnerability reporting and security guidelines.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Authors & Acknowledgments

*   This project is maintained by its primary user and owner.
*   Special thanks to the Sway, Waybar, Fuzzel, Hyprland, and other open-source communities for creating such fantastic software.

## Support & Contact

If you encounter any issues or have questions:

- 📝 [Open an Issue](https://github.com/ankitjd7795/cachyos-sway-dotfiles/issues) - Report bugs or request features
- 💬 [Start a Discussion](https://github.com/ankitjd7795/cachyos-sway-dotfiles/discussions) - Ask questions or share ideas
- ⭐ [Star the Repository](https://github.com/ankitjd7795/cachyos-sway-dotfiles) - Show your support!

## Show Your Setup

Using these dotfiles? Share your setup! Open a discussion or PR with screenshots of your customizations. We'd love to see what you've created!

## Acknowledgments

Special thanks to:
- The Sway, Waybar, and Wayland communities
- CachyOS developers for the optimized repositories
- All contributors who helped improve these dotfiles
