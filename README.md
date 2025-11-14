# CachyOS Sway Dotfiles

This repository contains my personal dotfiles for a Sway-based development environment on CachyOS, managed with `chezmoi`. It includes configurations for Sway, Waybar, Rofi, and other Wayland-native applications with a focus on aesthetics and productivity.

## Included Configurations

### Window Manager
- **Sway** - Tiling Wayland compositor (replacement for i3)

### Status Bar & Application Launcher
- **Waybar** - Highly customizable Wayland bar
- **Rofi** - Application launcher and window switcher

### Screen Management & Utilities
- **Swaylock** - Screen locker
- **Swaync** - Notification center for Sway
- **Swayr** - Window manager/ruler for Sway

### Terminal & File Management
- **WezTerm** - GPU-accelerated terminal emulator
- **Yazi** - Blazing fast terminal file manager with vim-like keybindings

### Media & System
- **MPV** - Media player with lyrics download capabilities (API token redacted)

### Shell Environments
- **Zsh** - Interactive shell with custom configurations
- **Bash** - Backup shell configurations

## Installation

### Prerequisites

Install required packages on CachyOS:

```bash
# Sway and related packages
sudo pacman -S sway swaylock swaync swayr waybar rofi yazi wezterm mpv zsh bash

# Additional tools that work well with this setup
sudo pacman -S grim slurp wl-clipboard mako brightnessctl playerctl pavucontrol alacritty foot noto-fonts ttf-jetbrains-mono ttf-font-awesome polkit-gnome

# For audio controls
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack

# For display management (if needed)
sudo pacman -S kanshi wlr-randr
```

### Install with Chezmoi

1. Install `chezmoi`:
```bash
sudo pacman -S chezmoi
```

2. Initialize this dotfiles repository:
```bash
chezmoi init --apply https://github.com/Hype000798/cachyos-sway-dotfiles.git
```

3. Apply the configurations:
```bash
chezmoi apply
```

### Manual Installation (Alternative)

1. Clone this repository:
```bash
git clone https://github.com/Hype000798/cachyos-sway-dotfiles.git ~/.local/share/chezmoi
```

2. Copy configurations to their appropriate locations:
```bash
cp -r ~/.local/share/chezmoi/dot_config/* ~/.config/
cp ~/.local/share/chezmoi/dot_* ~/
```

## Configuration Specifics

### WezTerm
- Uses JetBrains Mono Bold with ligature support
- Catppuccin Mocha theme
- Background blur effect (when supported)

### Sway
- Catppuccin Mocha theme
- Custom keybindings for splits (SHIFT+ALT+H/V)
- Includes SwayFX enhancements for rounded corners and other visual effects

### Waybar
- Catppuccin-themed status bar
- Includes system info, workspaces, window titles, and system tray
- Network and system monitoring modules

### Yazi
- Custom keymaps and themes
- Plugin support enabled

### MPV
- Custom keybindings
- Lyrics download support (requires API token - see below)
- Various playback enhancements

### Note on MPV Lyrics Functionality
The MPV configuration includes a script for downloading lyrics from Musixmatch. The API token has been redacted from this repository for security reasons. To enable lyrics functionality:

1. Obtain a Musixmatch API token
2. Edit `~/.config/mpv/scripts/lrc.lua` and replace `REDACTED_MUSIXMATCH_TOKEN` with your actual token
3. Or create `~/.config/mpv/script-opts/lrc.conf` with your token settings

## Customization

- **Wallpapers**: Wallpapers are stored separately and not included in this repository due to size constraints. Add your own wallpapers to `~/.config/backgrounds/`
- **Color Schemes**: Most configurations use Catppuccin themes (Mocha flavor) which can be changed in their respective config files
- **Key Bindings**: Most key bindings are set in the Sway config and can be customized to your preference

## Troubleshooting

### Audio Controls Not Working
- Ensure Pipewire services are running: `systemctl --user enable --now pipewire pipewire-pulse`

### Display Configuration Issues
- Install and configure `kanshi` for automatic display configuration

### Sway Effects Not Working
- Ensure your GPU drivers are properly installed and working
- Check that SwayFX or similar extensions are installed if using visual effects

## Maintenance

To update your dotfiles with changes from this repository:
```bash
chezmoi update
```

To see the difference between your current config and the repo version:
```bash
chezmoi diff
```

## Contributing

Feel free to fork this repository and adapt it for your own needs. If you find any issues or have improvements, feel free to open an issue or submit a pull request.