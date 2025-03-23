#!/bin/bash

switch_to_non_root(){
    if [[ $EUID -eq 0 ]]; then
        ORIGINAL_USER=$(logname 2>/dev/null || who am i | awk '{print $1}' || echo $SUDO_USER)

        if [[ -z "$ORIGINAL_USER" || "$ORIGINAL_USER" == "root" ]]; then
            echo "Cannot determine the original user. Please switch to Non root user. Exiting..."
            exit 1
        fi

        echo "Switching to non-root user: $ORIGINAL_USER"
        exec sudo -u "$ORIGINAL_USER" "$0" "$@"
        exit 0
    fi
}

switch_to_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "This part of script must be run as root. Elevating privileges..."
        sudo bash -c "$(declare -f root_install); root_install"
        return
    fi
}

question(){
    local app="$1" 
    echo
    read -p "Do you want to install $app? (y/n): " choice
    case "$choice" in 
        y|Y ) 
            echo "Installing $app..."
            echo
            return 0
            ;;
        n|N ) 
            echo "Skipping $app installation."
            echo
            return 1
            ;;
        * ) 
            echo
            echo "Invalid input. Please enter 'y' or 'n'."
            echo
            question
            ;;
    esac
}

########################################## NON ROOT APP INSTALL

non_root_install(){
    echo "Running as non-root user: $USER"

    if question "pipx"; then
        pip install pipx
    fi

	switch_to_root
}

########################################## ROOT APP INSTALL

root_install() {
    echo
    echo "Running as sudoers user: $USER"
}

########################################## QUESTION


switch_to_non_root
non_root_install