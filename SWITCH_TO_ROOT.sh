#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This part of the script must be run as root. Elevating privileges..."
    exec sudo bash "$0" "$@"
    exit 0
fi