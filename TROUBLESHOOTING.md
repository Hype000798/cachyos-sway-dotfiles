# Troubleshooting Guide

Common issues and solutions for CachyOS Sway Dotfiles setup.

## Table of Contents

- [Installation Issues](#installation-issues)
- [Sway/SwayFX Issues](#swayswayfx-issues)
- [Display Issues](#display-issues)
- [Audio Issues](#audio-issues)
- [Application Issues](#application-issues)
- [Performance Issues](#performance-issues)
- [Script Issues](#script-issues)
- [Theming Issues](#theming-issues)
- [Network Issues](#network-issues)
- [Input Device Issues](#input-device-issues)
- [Debugging Tools](#debugging-tools)

## Installation Issues

### Chezmoi Installation Fails

**Problem**: `chezmoi init` or `chezmoi apply` fails with errors.

**Solutions**:

1. **Check chezmoi installation**:
   ```bash
   chezmoi --version
   # If not installed
   sudo pacman -S chezmoi
   ```

2. **Check repository access**:
   ```bash
   # For SSH
   ssh -T git@github.com
   
   # If fails, use HTTPS instead
   chezmoi init --apply https://github.com/Hype000798/cachyos-sway-dotfiles.git
   ```

3. **Clear chezmoi state**:
   ```bash
   rm -rf ~/.local/share/chezmoi
   chezmoi init --apply git@github.com:Hype000798/cachyos-sway-dotfiles.git
   ```

---

### Setup Script Fails

**Problem**: `executable_arch-setup-script.sh` encounters errors.

**Solutions**:

1. **Check internet connection**:
   ```bash
   ping -c 3 archlinux.org
   ```

2. **Update system first**:
   ```bash
   sudo pacman -Syu
   ```

3. **Run script with verbose output**:
   ```bash
   bash -x ~/.local/share/chezmoi/executable_arch-setup-script.sh
   ```

4. **Check disk space**:
   ```bash
   df -h /
   ```

5. **Resolve package conflicts manually**:
   ```bash
   # If sway/swayfx conflict
   sudo pacman -Rdd sway
   sudo pacman -S swayfx
   ```

---

### Package Installation Failures

**Problem**: Specific packages fail to install.

**Solutions**:

1. **Update package database**:
   ```bash
   sudo pacman -Sy
   yay -Sy
   ```

2. **Clear package cache**:
   ```bash
   yay -Sc
   sudo pacman -Sc
   ```

3. **Check for conflicting packages**:
   ```bash
   pacman -Qi package-name
   ```

4. **Install packages individually**:
   ```bash
   yay -S package-name
   ```

5. **Check AUR helper**:
   ```bash
   # Reinstall yay if needed
   sudo pacman -S yay
   ```

---

## Sway/SwayFX Issues

### Sway Won't Start

**Problem**: Sway fails to launch or crashes immediately.

**Solutions**:

1. **Check Sway installation**:
   ```bash
   which sway
   sway --version
   ```

2. **Check for config errors**:
   ```bash
   sway -C ~/.config/sway/config
   ```

3. **View Sway logs**:
   ```bash
   journalctl --user -xe | grep sway
   ```

4. **Start Sway with debug output**:
   ```bash
   sway -d 2>&1 | tee ~/sway-debug.log
   ```

5. **Reset to default config**:
   ```bash
   mv ~/.config/sway ~/.config/sway.backup
   mkdir -p ~/.config/sway
   cp /etc/sway/config ~/.config/sway/config
   ```

---

### SwayFX Features Not Working

**Problem**: Blur, shadows, or rounded corners don't appear.

**Solutions**:

1. **Verify SwayFX installation**:
   ```bash
   sway --version
   # Should show swayfx version
   ```

2. **Check if regular Sway is installed instead**:
   ```bash
   pacman -Q sway
   pacman -Q swayfx
   
   # Remove sway and install swayfx
   sudo pacman -Rdd sway
   sudo pacman -S swayfx
   ```

3. **Verify SwayFX config syntax**:
   ```bash
   # Check ~/.config/sway/config for SwayFX directives
   grep -E "blur|shadow|corner_radius" ~/.config/sway/config
   ```

4. **Check GPU drivers**:
   ```bash
   # Verify proper drivers are installed
   lspci -k | grep -A 3 VGA
   ```

---

### Configuration Not Loading

**Problem**: Changes to config files don't take effect.

**Solutions**:

1. **Reload Sway config**:
   ```bash
   swaymsg reload
   # Or press Mod+Shift+c
   ```

2. **Check config syntax**:
   ```bash
   sway -C ~/.config/sway/config
   ```

3. **Verify chezmoi applied changes**:
   ```bash
   chezmoi diff
   chezmoi apply -v
   ```

4. **Check include directives**:
   ```bash
   grep include ~/.config/sway/config
   ```

---

## Display Issues

### Wallpaper Not Loading

**Problem**: SWWW wallpaper doesn't appear or changes.

**Solutions**:

1. **Check SWWW daemon**:
   ```bash
   pgrep swww-daemon
   # If not running
   swww init
   ```

2. **Manually set wallpaper**:
   ```bash
   swww img ~/.config/backgrounds/your-image.jpg
   ```

3. **Check wallpaper directory**:
   ```bash
   ls -la ~/.config/backgrounds/
   ```

4. **Verify script execution**:
   ```bash
   ~/.config/sway/scripts/swww_init_simple.sh
   ```

5. **Check for permission issues**:
   ```bash
   chmod +x ~/.config/sway/scripts/swww_init*.sh
   ```

---

### Multiple Monitor Issues

**Problem**: External monitors not detected or incorrectly configured.

**Solutions**:

1. **List outputs**:
   ```bash
   swaymsg -t get_outputs
   ```

2. **Configure outputs manually**:
   ```bash
   # Add to ~/.config/sway/config.d/outputs.conf
   output HDMI-A-1 resolution 1920x1080 position 1920,0
   output eDP-1 resolution 1920x1080 position 0,0
   ```

3. **Reload configuration**:
   ```bash
   swaymsg reload
   ```

4. **Check display connections**:
   ```bash
   drm_info | grep connected
   ```

5. **Reset display configuration**:
   ```bash
   swaymsg output '*' enable
   ```

---

### Screen Tearing or Flickering

**Problem**: Visual artifacts or screen tearing.

**Solutions**:

1. **Check GPU drivers**:
   ```bash
   # AMD
   sudo pacman -S mesa vulkan-radeon libva-mesa-driver
   
   # Intel
   sudo pacman -S mesa vulkan-intel intel-media-driver
   
   # NVIDIA
   sudo pacman -S nvidia nvidia-utils
   ```

2. **Disable vsync (test)**:
   ```bash
   # In ~/.config/sway/config
   # Comment out or adjust
   ```

3. **Check kernel parameters**:
   ```bash
   cat /proc/cmdline
   ```

---

### HiDPI/Scaling Issues

**Problem**: Text or UI elements too small/large.

**Solutions**:

1. **Set output scale**:
   ```bash
   # In ~/.config/sway/config.d/outputs.conf
   output eDP-1 scale 1.5
   ```

2. **Set GTK scaling**:
   ```bash
   # Add to ~/.config/sway/config
   exec_always gsettings set org.gnome.desktop.interface scaling-factor 2
   ```

3. **Set Qt scaling**:
   ```bash
   # Add to ~/.profile or ~/.bash_profile
   export QT_SCALE_FACTOR=1.5
   ```

4. **Reload Sway**:
   ```bash
   swaymsg reload
   ```

---

## Audio Issues

### No Sound

**Problem**: Audio not working or no output devices.

**Solutions**:

1. **Check PipeWire services**:
   ```bash
   systemctl --user status pipewire pipewire-pulse wireplumber
   ```

2. **Start audio services**:
   ```bash
   systemctl --user start pipewire pipewire-pulse wireplumber
   systemctl --user enable pipewire pipewire-pulse wireplumber
   ```

3. **Run audio setup script**:
   ```bash
   ~/.config/sway/scripts/start_audio_services.sh
   ```

4. **Check audio devices**:
   ```bash
   pactl list sinks
   pactl list sources
   ```

5. **Set default sink**:
   ```bash
   pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo
   ```

---

### Volume Keys Not Working

**Problem**: Media keys don't control volume.

**Solutions**:

1. **Check keybinding configuration**:
   ```bash
   grep XF86Audio ~/.config/sway/config.d/default-options-and-keymaps.conf
   ```

2. **Test SwayOSD**:
   ```bash
   swayosd-client --output-volume raise
   ```

3. **Install SwayOSD**:
   ```bash
   yay -S swayosd
   ```

4. **Check device name**:
   ```bash
   pactl list sinks short
   # Update device name in keybindings if needed
   ```

---

### Audio Crackling or Popping

**Problem**: Audio quality issues or distortion.

**Solutions**:

1. **Adjust buffer settings**:
   ```bash
   # Edit /etc/pipewire/pipewire.conf
   sudo nano /etc/pipewire/pipewire.conf
   # Increase quantum and rate settings
   ```

2. **Restart PipeWire**:
   ```bash
   systemctl --user restart pipewire pipewire-pulse wireplumber
   ```

3. **Check CPU usage**:
   ```bash
   htop
   # High CPU can cause audio issues
   ```

---

## Application Issues

### Fuzzel Won't Launch

**Problem**: Application launcher doesn't appear.

**Solutions**:

1. **Check Fuzzel installation**:
   ```bash
   which fuzzel
   fuzzel --version
   ```

2. **Test Fuzzel manually**:
   ```bash
   fuzzel
   ```

3. **Check configuration**:
   ```bash
   cat ~/.config/fuzzel/fuzzel.ini
   ```

4. **Reset Fuzzel config**:
   ```bash
   mv ~/.config/fuzzel ~/.config/fuzzel.backup
   chezmoi apply
   ```

---

### Terminal Not Opening

**Problem**: Wezterm fails to launch.

**Solutions**:

1. **Check installation**:
   ```bash
   which wezterm
   wezterm --version
   ```

2. **Test terminal manually**:
   ```bash
   wezterm
   ```

3. **Check configuration**:
   ```bash
   wezterm check-config ~/.config/wezterm/wezterm.lua
   ```

4. **Use alternative terminal**:
   ```bash
   # Add to ~/.config/sway/config
   set $term alacritty
   bindsym $mod+Return exec alacritty
   ```

---

### Waybar Not Showing

**Problem**: Status bar doesn't appear.

**Solutions**:

1. **Check Waybar process**:
   ```bash
   pgrep waybar
   killall waybar
   waybar &
   ```

2. **Check configuration syntax**:
   ```bash
   waybar --log-level debug
   ```

3. **Verify JSON syntax**:
   ```bash
   cat ~/.config/waybar/config.jsonc | jsonc-parser
   ```

4. **Check CSS**:
   ```bash
   cat ~/.config/waybar/style.css
   ```

---

### Notifications Not Working

**Problem**: SwayNC notifications don't appear.

**Solutions**:

1. **Check SwayNC service**:
   ```bash
   pgrep swaync
   # Restart if needed
   killall swaync
   swaync &
   ```

2. **Test notification**:
   ```bash
   notify-send "Test" "This is a test notification"
   ```

3. **Check configuration**:
   ```bash
   cat ~/.config/swaync/config.json
   ```

4. **Verify keybinding**:
   ```bash
   # Mod+Shift+n
   swaync-client -t -sw
   ```

---

## Performance Issues

### High CPU Usage

**Problem**: System runs slow or CPU usage is high.

**Solutions**:

1. **Identify resource-heavy processes**:
   ```bash
   htop
   # Press F5 to see tree view
   ```

2. **Disable visual effects**:
   ```bash
   # Comment out in ~/.config/sway/config
   # blur enable
   # shadows enable
   ```

3. **Reduce Waybar update frequency**:
   ```bash
   # In ~/.config/waybar/config.jsonc
   # Increase "interval" values
   ```

4. **Disable autotiling**:
   ```bash
   # Comment out in Sway config
   # exec_always autotiling-rs
   ```

---

### Memory Issues

**Problem**: High RAM usage or out of memory errors.

**Solutions**:

1. **Check memory usage**:
   ```bash
   free -h
   htop
   ```

2. **Enable zram**:
   ```bash
   sudo pacman -S zram-generator
   sudo systemctl enable --now systemd-zram-setup@zram0.service
   ```

3. **Close unused applications**:
   ```bash
   # Check running applications
   swaymsg -t get_tree
   ```

4. **Reduce SwayFX effects**:
   ```bash
   # Reduce blur_passes in config
   blur_passes 1
   ```

---

### Slow Application Launch

**Problem**: Applications take long to start.

**Solutions**:

1. **Check disk I/O**:
   ```bash
   iotop
   ```

2. **Use SSD TRIM** (if on SSD):
   ```bash
   sudo systemctl enable --now fstrim.timer
   ```

3. **Clear package cache**:
   ```bash
   sudo pacman -Sc
   ```

4. **Check system load**:
   ```bash
   uptime
   ```

---

## Script Issues

### Scripts Not Executing

**Problem**: Custom scripts fail to run.

**Solutions**:

1. **Check permissions**:
   ```bash
   ls -l ~/.config/sway/scripts/
   chmod +x ~/.config/sway/scripts/*.sh
   ```

2. **Check shebang**:
   ```bash
   head -n 1 ~/.config/sway/scripts/script-name.sh
   # Should be #!/bin/bash
   ```

3. **Test script directly**:
   ```bash
   bash -x ~/.config/sway/scripts/script-name.sh
   ```

4. **Check dependencies**:
   ```bash
   # Read script to see required commands
   cat ~/.config/sway/scripts/script-name.sh
   ```

---

### Screenshot Script Issues

**Problem**: Screenshots not working properly.

**Solutions**:

1. **Check dependencies**:
   ```bash
   which grim slurp wl-copy
   sudo pacman -S grim slurp wl-clipboard
   ```

2. **Test components**:
   ```bash
   grim /tmp/test.png
   slurp
   ```

3. **Check output directory**:
   ```bash
   mkdir -p ~/Pictures/Screenshots
   ```

4. **Run script with debug**:
   ```bash
   bash -x ~/.config/sway/scripts/screenshot.sh screen
   ```

---

## Theming Issues

### GTK Theme Not Applied

**Problem**: Applications don't use configured theme.

**Solutions**:

1. **Set GTK theme**:
   ```bash
   gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"
   ```

2. **Use lxappearance**:
   ```bash
   lxappearance
   ```

3. **Check theme installation**:
   ```bash
   ls /usr/share/themes/
   ls ~/.themes/
   ```

4. **Set environment variables**:
   ```bash
   # Add to ~/.config/sway/config
   exec_always gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"
   exec_always gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
   ```

---

### Qt Applications Look Different

**Problem**: Qt apps don't match GTK theme.

**Solutions**:

1. **Install qt5ct**:
   ```bash
   sudo pacman -S qt5ct kvantum
   ```

2. **Set Qt platform theme**:
   ```bash
   export QT_QPA_PLATFORMTHEME=qt5ct
   # Add to ~/.profile
   ```

3. **Configure with qt5ct**:
   ```bash
   qt5ct
   ```

4. **Use Kvantum**:
   ```bash
   kvantummanager
   ```

---

### Cursor Theme Issues

**Problem**: Cursor doesn't match theme.

**Solutions**:

1. **Set cursor theme**:
   ```bash
   gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"
   ```

2. **Check cursor installation**:
   ```bash
   ls /usr/share/icons/
   ```

3. **Set in Sway config**:
   ```bash
   # Add to ~/.config/sway/config
   seat seat0 xcursor_theme Adwaita 24
   ```

---

## Network Issues

### NetworkManager Not Working

**Problem**: Can't connect to networks.

**Solutions**:

1. **Check NetworkManager service**:
   ```bash
   systemctl status NetworkManager
   sudo systemctl enable --now NetworkManager
   ```

2. **Use nmtui**:
   ```bash
   nmtui
   ```

3. **Check network devices**:
   ```bash
   nmcli device status
   ```

4. **Restart NetworkManager**:
   ```bash
   sudo systemctl restart NetworkManager
   ```

---

### WiFi Not Connecting

**Problem**: WiFi connection issues.

**Solutions**:

1. **Check wireless device**:
   ```bash
   ip link show
   nmcli radio wifi
   ```

2. **Enable WiFi**:
   ```bash
   nmcli radio wifi on
   ```

3. **Scan for networks**:
   ```bash
   nmcli device wifi list
   ```

4. **Connect to network**:
   ```bash
   nmcli device wifi connect "SSID" password "PASSWORD"
   ```

---

## Input Device Issues

### Touchpad Not Working

**Problem**: Laptop touchpad doesn't respond.

**Solutions**:

1. **Check input devices**:
   ```bash
   swaymsg -t get_inputs
   ```

2. **Configure touchpad in Sway**:
   ```bash
   # Add to ~/.config/sway/config.d/inputs.conf
   input type:touchpad {
       tap enabled
       natural_scroll enabled
       dwt enabled
   }
   ```

3. **Reload configuration**:
   ```bash
   swaymsg reload
   ```

---

### Keyboard Layout Issues

**Problem**: Wrong keyboard layout.

**Solutions**:

1. **Set keyboard layout**:
   ```bash
   # In ~/.config/sway/config.d/inputs.conf
   input type:keyboard {
       xkb_layout "us"
       xkb_options "caps:escape"
   }
   ```

2. **Check current layout**:
   ```bash
   swaymsg -t get_inputs | grep -A 20 keyboard
   ```

3. **Reload Sway**:
   ```bash
   swaymsg reload
   ```

---

## Debugging Tools

### Essential Commands

```bash
# Sway information
swaymsg -t get_version
swaymsg -t get_config
swaymsg -t get_outputs
swaymsg -t get_workspaces
swaymsg -t get_tree
swaymsg -t get_inputs

# System logs
journalctl --user -xe
journalctl --user -u sway --since today
dmesg | tail

# Process information
ps aux | grep sway
pgrep -a waybar

# System information
uname -a
lspci -k
lsusb
```

### Log Files

```bash
# Sway logs
~/.local/share/sway/sway.log

# System journal
journalctl --user -xe

# Xorg log (if using Xwayland)
~/.local/share/xorg/Xorg.0.log
```

### Debug Mode

Start Sway with verbose logging:
```bash
sway -d >~/sway-debug.log 2>&1
```

---

## Getting Help

If you can't resolve your issue:

1. **Search existing issues**: Check [GitHub Issues](https://github.com/Hype000798/cachyos-sway-dotfiles/issues)
2. **Collect information**:
   - OS version: `cat /etc/os-release`
   - Sway version: `sway --version`
   - Error logs
   - Configuration files
3. **Create detailed issue report**
4. **Join community discussions**

---

For additional support, consult:
- [Sway Wiki](https://github.com/swaywm/sway/wiki)
- [Arch Wiki](https://wiki.archlinux.org/)
- [CachyOS Forum](https://forum.cachyos.org/)
