#!/bin/bash

source ./SWITCH_TO_ROOT.sh

command_exists() {
    command -v "$1" &> /dev/null
}

if [ -f /etc/os-release ]; then
    source /etc/os-release
    DISTRO=$ID
elif command_exists lsb_release; then
    DISTRO=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
elif [ -f /etc/redhat-release ]; then
    DISTRO="rhel"
elif [ -f /etc/debian_version ]; then
    DISTRO="debian"
elif [ -f /etc/gentoo-release ]; then
    DISTRO="gentoo"
else
    echo "Unsupported Linux distribution!"
    exit 1
fi

echo "Detected Linux Distribution: $DISTRO"
echo "Starting system update..."

case "$DISTRO" in
    ubuntu|debian)
        sudo apt update && sudo apt upgrade -y
        ;;
    centos|rhel|rocky|almalinux)
        sudo yum update -y
        ;;
    fedora)
        sudo dnf update -y
        ;;
    arch)
        sudo pacman -Syu --noconfirm
        ;;
    suse|opensuse)
        sudo zypper refresh && sudo zypper update -y
        ;;
    gentoo)
        sudo emerge --sync && sudo emerge -u world
        ;;
    *)
        echo "Update command not defined for this distribution."
        exit 1
        ;;
esac

echo "System update complete!"
