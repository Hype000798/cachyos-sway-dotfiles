#!/bin/bash

# Arch Linux Setup Script with CachyOS Repository
# This script checks for CachyOS repository, adds it if missing,
# and installs packages similar to your current system setup

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to ask user for confirmation
ask_confirmation() {
    local prompt="$1"
    local default="${2:-n}"
    local response

    echo -n -e "${YELLOW}${prompt} (Y/n): ${NC}"
    read -r response

    # If response is empty, use default
    if [[ -z "$response" ]]; then
        response=$default
    fi

    if [[ $response =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   print_error "This script should not be run as root"
   exit 1
fi

# Function to check if CachyOS repository is already added
check_cachyos_repo() {
    print_status "Checking if CachyOS repository is already added..."
    
    if grep -q "^\[cachyos\]" /etc/pacman.conf; then
        print_success "CachyOS repository is already added to pacman.conf"
        return 0
    else
        print_warning "CachyOS repository not found in pacman.conf"
        return 1
    fi
}

# Function to add CachyOS repository
add_cachyos_repo() {
    print_status "Adding CachyOS repository..."

    # Backup pacman.conf before modification
    sudo cp /etc/pacman.conf "/etc/pacman.conf.backup.$(date +%Y%m%d_%H%M%S)"
    print_status "Backup of pacman.conf created"

    # Download and install the CachyOS repository
    if command -v curl >/dev/null 2>&1; then
        curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
    elif command -v wget >/dev/null 2>&1; then
        wget https://mirror.cachyos.org/cachyos-repo.tar.xz
    else
        print_error "Neither curl nor wget found. Please install one of them."
        exit 1
    fi

    tar xvf cachyos-repo.tar.xz
    cd cachyos-repo

    # Run the CachyOS repository installer
    chmod +x ./cachyos-repo.sh
    sudo ./cachyos-repo.sh

    cd ..
    rm -rf cachyos-repo cachyos-repo.tar.xz

    print_success "CachyOS repository has been added"
}

# Function to update package databases
update_package_db() {
    print_status "Updating package databases..."
    sudo pacman -Sy
    print_success "Package databases updated"
}

# List of packages to install based on the current system
PACKAGES=(
    # Essential packages
    "base"
    "base-devel"
    "git"
    "yay"
    "paru"

    # Sway window manager and related packages
    "swayfx"
    "swayidle"
    "swaybg"
    "waybar"
    "waypaper"
    "wl-clipboard"
    "cliphist"
    "autotiling-rs"
    "swaync"
    "swayosd"
    "swayimg"
    "sway-contrib"
    "grim"
    "slurp"
    "wofi"

    # Terminal and utilities
    "wezterm"
    "fuzzel"
    "bat"
    "alacritty"
    "foot"
    "eza"
    "zsh"
    "oh-my-posh"

    # Applications
    "brave-bin"
    "nemo"
    "nemo-fileroller"
    "nemo-python"
    "nemo-terminal"
    "nemo-preview"
    "nemo-seahorse"
    "nemo-emblems"
    "nemo-image-converter"
    "nemo-pastebin"
    "nemo-audio-tab"
    "firefox"
    "firefox-ublock-origin"
    "visual-studio-code-bin"
    "zed"
    "yazi"

    # Audio system
    "pipewire"
    "pipewire-alsa"
    "pipewire-pulse"
    "pipewire-jack"
    "wireplumber"
    "gst-plugin-pipewire"

    # Additional utilities
    "swww"
    "brightnessctl"
    "networkmanager"
    "networkmanager-dmenu"
    "network-manager-applet"
    "blueman"
    "bluez"
    "bluez-utils"
    "iwd"
    "wireless_tools"
    "xdg-utils"

    # Theming
    "adwaita-icon-theme"
    "adwaita-cursors"
    "adwaita-fonts"
    "otf-font-awesome"
    "ttf-0xproto-nerd"
    "ttf-jetbrains-mono-nerd"
    "ttf-meslo-nerd"

    # Development tools
    "rustup"
    "rust-analyzer"
    "go"
    "python"
    "nodejs"
    "npm"
    "github-cli"

    # Multimedia
    "mpv"
    "ffmpeg"
    "imv"
    "harmonoid-bin"

    # Font and graphics
    "ttf-dejavu"
    "ttf-liberation"
    "noto-fonts"
    "mesa"
    "vulkan-radeon"
    "vulkan-intel"
    "vulkan-nouveau"
    "libva-mesa-driver"
    "libva-intel-driver"
    "intel-media-driver"
    "intel-media-sdk"
    "xf86-video-amdgpu"
    "xf86-video-ati"
    "xf86-video-nouveau"
    "v4l2loopback-dkms"

    # System utilities
    "htop"
    "neofetch"
    "bleachbit"
    "timeshift"
    "reflector"
    "grub"
    "efibootmgr"
    "os-prober"
    "dosfstools"
    "mtools"
    "amd-ucode"
    "intel-ucode"
    "btrfs-progs"
    "lvm2"
    "smartmontools"
    "snapper"
    "limine"
    "limine-snapper-sync"
    "zram-generator"

    # Display and Xorg
    "ly"
    "xorg-server"
    "xorg-xinit"
    "xorg-xwayland"

    # Compression and archives
    "zip"
    "unzip"
    "p7zip"
    "tar"

    # Security and privacy
    "firejail"
    "keepassxc"

    # Office and productivity
    "libreoffice-still"
    "aspell"
    "aspell-en"

    # Printing
    "cups"
    "cups-pdf"
    "ghostscript"
    "gsfonts"
    "hplip"
    "sane"
    "simple-scan"

    # Bluetooth
    "bluez-hid2hci"

    # Additional audio tools
    "pavucontrol"
    "pasystray"

    # Archiving tools
    "file-roller"
    "peazip"

    # Text editors
    "nvim"
    "nano"
    "gedit"
    "vim"

    # Communication
    "discord"
    "telegram-desktop"
    "ayugram-desktop"
    "vesktop"

    # Game tools (since some gamemode packages were detected)
    "gamemode"
    "gamescope"
    "steam"
    "wine"
    "protonup-qt"

    # Backup and sync tools
    "rsync"
    "rclone"
    "chezmoi"

    # Customization
    "lxappearance"
    "papirus-icon-theme"
    "breeze-gtk-theme"
    "materia-gtk-theme"
    "qt5ct"
    "kvantum"

    # Media creation
    "gimp"
    "obs-studio-browser"
    "krita"

    # Security tools
    "gufw"

    # Other
    "octopi"
    "hyprlock"
    "wmenu"
)

# Function to install packages
install_packages() {
    print_status "Installing packages..."
    
    # Determine if we should use pacman or an AUR helper
    if command -v yay >/dev/null 2>&1; then
        PACKAGE_MANAGER="yay"
        print_status "Using yay as package manager"
    elif command -v paru >/dev/null 2>&1; then
        PACKAGE_MANAGER="paru"
        print_status "Using paru as package manager"
    else
        PACKAGE_MANAGER="sudo pacman"
        print_status "Using pacman as package manager (some packages might need manual AUR installation)"
    fi
    
    # Convert array to string
    PKG_LIST=$(printf '%s ' "${PACKAGES[@]}")
    
    # Install packages
    # shellcheck disable=SC2086
    $PACKAGE_MANAGER -S --needed --noconfirm $PKG_LIST
    
    print_success "Packages installed successfully"
}

# Main script execution
main() {
    print_status "Starting Arch Linux setup with CachyOS repository..."
    
    # Check if CachyOS repository is added
    if ! check_cachyos_repo; then
        if ask_confirmation "Do you want to add the CachyOS repository?"; then
            add_cachyos_repo
        else
            print_warning "Skipping CachyOS repository addition"
        fi
    fi
    
    # Update package databases
    update_package_db
    
    # Install packages
    if ask_confirmation "Do you want to proceed with installing the predefined packages?"; then
        install_packages
    else
        print_warning "Skipping package installation"
    fi
    
    print_success "Setup completed!"
    echo -e "\n${GREEN}Note:${NC} You may need to log out and log back in to use your new Sway configuration."
}

# Run the main function
main "$@"

# End of script