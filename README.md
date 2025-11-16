# CachyOS Sway Dotfiles

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Version](https://img.shields.io/badge/version-1.0.0-blue)

A collection of meticulously crafted dotfiles for a beautiful and functional Sway window manager setup on CachyOS.

## Description

This project provides a complete set of configuration files (dotfiles) designed to enhance the user experience of the Sway Wayland compositor on CachyOS. It aims to offer a visually appealing, highly efficient, and well-organized desktop environment out-of-the-box.

**Why it exists:**
Many users prefer a pre-configured, aesthetically pleasing, and functional Sway setup without the hassle of configuring every component from scratch. These dotfiles solve that problem by providing a ready-to-use configuration that balances modern aesthetics with practical usability.

**Key Features:**
*   **Sway Configuration:** Optimized keybindings, workspaces, and window management rules.
*   **Waybar Integration:** A sleek and informative Waybar configuration for system status, notifications, and quick access.
*   **Rofi Theming:** Custom Rofi themes for a consistent and visually pleasing application launcher and menu.
*   **Themed Applications:** Cohesive theming across various applications for a unified look and feel.
*   **Background Management:** A curated collection of wallpapers and scripts for dynamic background changes.

**What makes it unique:**
These dotfiles are specifically tailored for CachyOS, ensuring compatibility and leveraging its strengths. They focus on a clean, minimalist design while providing robust functionality, making them ideal for both new Sway users and seasoned enthusiasts looking for a fresh setup.

## Table of Contents

1.  [Project Title & Badges](#cachyos-sway-dotfiles)
2.  [Description](#description)
3.  [Installation](#installation)
4.  [Quick Start / Usage](#quick-start--usage)
5.  [API Documentation](#api-documentation)
6.  [Configuration](#configuration)
7.  [Examples](#examples)
8.  [Development](#development)
9.  [Roadmap](#roadmap)
10. [Contributing](#contributing)
11. [Testing](#testing)
12. [License](#license)
13. [Authors & Acknowledgments](#authors--acknowledgments)
14. [Support & Contact](#support--contact)

## Installation

### Prerequisites

Before installing these dotfiles, ensure you have the following installed on your CachyOS system:

*   **Sway**: The Wayland compositor.
*   **Waybar**: Highly customizable Wayland bar.
*   **Rofi**: A window switcher, application launcher, and dmenu replacement.
*   **Swaylock**: Screen locker for Sway.
*   **Swayidle**: Idle management daemon for Sway.
*   **Wlogout**: Logout menu for Wayland.
*   **Wezterm**: A GPU-accelerated cross-platform terminal emulator.
*   **Yazi**: A modern, high-performance terminal file manager.
*   **Git**: For cloning the repository.

### Step-by-step installation instructions

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/cachyos-sway-dotfiles.git ~/.dotfiles
    ```
    (Replace `your-username` with the actual GitHub username if this project is hosted there, or adjust the path if you prefer a different location.)

2.  **Backup your existing dotfiles (optional but recommended):**
    ```bash
    mkdir -p ~/.config-backup
    mv ~/.config/sway ~/.config-backup/sway_backup
    mv ~/.config/waybar ~/.config-backup/waybar_backup
    # ... and so on for other configurations you might have
    ```

3.  **Create symlinks for the new dotfiles:**
    Navigate into the cloned repository and create symbolic links to your home directory. This allows you to manage your dotfiles with Git easily.

    ```bash
    cd ~/.dotfiles
    ln -sf ~/.dotfiles/dot_config/sway ~/.config/sway
    ln -sf ~/.dotfiles/dot_config/waybar ~/.config/waybar
    ln -sf ~/.dotfiles/dot_config/rofi ~/.config/rofi
    ln -sf ~/.dotfiles/dot_config/swaylock ~/.config/swaylock
    ln -sf ~/.dotfiles/dot_config/swaync ~/.config/swaync
    ln -sf ~/.dotfiles/dot_config/swayr ~/.config/swayr
    ln -sf ~/.dotfiles/dot_config/wezterm ~/.config/wezterm
    ln -sf ~/.dotfiles/dot_config/wlogout ~/.config/wlogout
    ln -sf ~/.dotfiles/dot_config/yazi ~/.config/yazi
    ln -sf ~/.dotfiles/dot_bashrc ~/.bashrc
    ln -sf ~/.dotfiles/dot_bash_profile ~/.bash_profile
    ln -sf ~/.dotfiles/dot_bash_logout ~/.bash_logout
    ln -sf ~/.dotfiles/dot_zshrc ~/.zshrc
    ```
    *Note: If you use Zsh, ensure you symlink `dot_zshrc` to `~/.zshrc`.*

4.  **Copy backgrounds:**
    ```bash
    cp -r ~/.dotfiles/dot_config/backgrounds ~/.config/backgrounds
    ```

### Verification Steps

After installation, log out and log back into your Sway session. You should see the new configuration applied. Check the Waybar, Rofi, and terminal (Wezterm) to ensure they reflect the new themes and settings.

## Quick Start / Usage

Once installed, your Sway environment will be transformed. Here are some common interactions:

*   **Launch Rofi:** `Mod + d` (or `Super + d`)
*   **Terminal:** `Mod + Enter` (opens Wezterm)
*   **Close Window:** `Mod + Shift + q`
*   **Lock Screen:** `Mod + Shift + l`
*   **Exit Sway:** `Mod + Shift + e`
*   **Reload Sway Config:** `Mod + Shift + c`
*   **Change Workspace:** `Mod + [1-9]`
*   **Move Window to Workspace:** `Mod + Shift + [1-9]`
*   **Screenshot:** `Print Screen` (full screen), `Shift + Print Screen` (selection)

Explore `~/.config/sway/config` for a full list of keybindings.

## API Documentation

This project primarily consists of configuration files and does not expose a public API.

## Configuration

The core configurations are located in the `~/.config/` directory, symlinked from this repository.

*   **Sway:** `~/.config/sway/config` - Main Sway configuration, keybindings, and output settings.
*   **Waybar:** `~/.config/waybar/config` and `~/.config/waybar/style.css` - Bar layout, modules, and styling.
*   **Rofi:** `~/.config/rofi/config.rasi` and theme files - Rofi appearance and behavior.
*   **Wezterm:** `~/.config/wezterm/wezterm.lua` - Terminal emulator settings.
*   **Backgrounds:** `~/.config/backgrounds/` - Image files used for wallpapers.

Feel free to modify these files to suit your personal preferences. Remember to reload Sway (`Mod + Shift + c`) after making changes to the Sway configuration.

## Examples

Screenshots showcasing the desktop environment with these dotfiles will be added here soon. For now, imagine a clean, dark-themed desktop with a functional Waybar and a responsive Rofi launcher.

## Development

These dotfiles are managed using Git. To contribute or make personal changes:

1.  **Fork the repository** (if contributing).
2.  **Clone your fork** or the original repository.
3.  **Make your changes** to the configuration files.
4.  **Test your changes** by reloading Sway or the specific application.
5.  **Commit your changes** with a clear and concise message.
6.  **Push to your fork** and open a pull request (if contributing).

## Roadmap

*   Add more theme variations (e.g., light themes).
*   Integrate additional useful utilities and their configurations.
*   Improve documentation for specific configuration sections.
*   Automate installation with a script.

## Contributing

Contributions are welcome! Please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) (to be created) for guidelines on how to contribute to this project.

## Testing

While dotfiles don't have traditional unit tests, you can "test" changes by:

1.  **Reloading Sway:** After modifying `~/.config/sway/config`, press `Mod + Shift + c` to apply changes.
2.  **Restarting Waybar:** If you change Waybar config, kill the existing Waybar process and launch it again from a terminal.
3.  **Checking application behavior:** Verify that Rofi, Wezterm, and other applications behave as expected after configuration changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Authors & Acknowledgments

*   **[Your Name/GitHub Handle]** - Initial work and maintenance.

Special thanks to the Sway, Waybar, Rofi, and other open-source communities for creating such fantastic software.

## Support & Contact

If you encounter any issues or have questions, please open an issue on the [GitHub Issue Tracker](https://github.com/your-username/cachyos-sway-dotfiles/issues).
