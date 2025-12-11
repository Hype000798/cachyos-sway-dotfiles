# CachyOS Sway Dotfiles

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Version](https://img.img.shields.io/badge/version-1.0.0-blue)

A collection of meticulously crafted dotfiles for a beautiful and functional Sway Wayland compositor setup on CachyOS, managed with `chezmoi`.

## Table of Contents

- [Project Description](#project-description)
- [Key Features](#key-features)
- [Installation](#installation)
- [Quick Start / Usage](#quick-start--usage)
- [Configuration Details](#configuration-details)
- [Development Workflow](#development-workflow)
- [Roadmap](#roadmap)
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

These dotfiles are managed using `chezmoi` and are designed to be used with a private GitHub repository for secure storage. Secure setup involves using SSH keys.

### Prerequisites

Before installing these dotfiles, ensure you have the following installed on your CachyOS system:

*   **`chezmoi`**: Install via your package manager (e.g., `sudo pacman -S chezmoi`).
*   **Git**: For cloning the repository.
*   **SSH Keys**: If you haven't already, generate an SSH key pair and add your public key to your GitHub account. For instructions, refer to GitHub's official documentation on [generating SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [adding it to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

### Recommended Installation (Using SSH)

This method automates the setup process, including comprehensive package installation via the provided script.

1.  **Initialize `chezmoi`:** Use the SSH URL of your private repository. This command will clone the repository to `~/.local/share/chezmoi` and apply the dotfiles to your system.
    ```bash
    chezmoi init --apply git@github.com:Hype000798/cachyos-sway-dotfiles.git
    ```
    (Ensure your SSH agent is running and your key is loaded.)
2.  **Run the Setup Script:** The `executable_arch-setup-script.sh` is now available locally in your `chezmoi` source directory (e.g., `~/.local/share/chezmoi/executable_arch-setup-script.sh`). Execute it to install system packages and configure CachyOS repositories:
    ```bash
    ~/.local/share/chezmoi/executable_arch-setup-script.sh
    ```
    This script will guide you through adding CachyOS repos, updating package databases, and installing all recommended packages for this dotfile setup, including correctly handling `sway` vs `swayfx` installation.

### Manual Installation (Advanced)

If you prefer a more granular setup or need to inspect each step:

1.  **Clone the Repository:**
    ```bash
    git clone git@github.com:Hype000798/cachyos-sway-dotfiles.git ~/.local/share/chezmoi
    ```
    (Ensure your SSH agent is running and your key is loaded.)
2.  **Install Prerequisites:** Manually install all necessary software (Sway, Waybar, Fuzzel, Hyprlock, Wezterm, etc.) using your package manager. You can refer to `~/.local/share/chezmoi/executable_arch-setup-script.sh` for a comprehensive list of recommended packages.
3.  **Apply Dotfiles:
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

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Authors & Acknowledgments

*   This project is maintained by its primary user and owner.
*   Special thanks to the Sway, Waybar, Fuzzel, Hyprland, and other open-source communities for creating such fantastic software.

## Support & Contact

If you encounter any issues or have questions, please open an issue on the [GitHub Issue Tracker](https://github.com/Hype000798/cachyos-sway-dotfiles/issues).
