#!/bin/bash

echo "🔍 This script ensures it runs as a non-root user."

if [[ $EUID -eq 0 ]]; then
    ORIGINAL_USER=$(logname 2>/dev/null || who am i 2>/dev/null | awk '{print $1}' || echo $SUDO_USER)

    if [[ -z "$ORIGINAL_USER" || "$ORIGINAL_USER" == "root" ]]; then
        echo "❌ Cannot determine the original non-root user. Please switch to a non-root user manually. Exiting..."
        exit 1
    fi

    echo "🔄 Switching to non-root user: $ORIGINAL_USER"
    exec sudo -u "$ORIGINAL_USER" "$0" "$@"
    exit 0
else
    echo "✅ You are already running as a non-root user: $(id -un)"
fi
