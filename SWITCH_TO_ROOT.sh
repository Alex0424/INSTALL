#!/bin/bash

echo "🔍 This script ensures it runs as a 🫜root🫜 user."


if [[ $EUID -ne 0 ]]; then
    echo "Elevating privileges..."
    exec sudo bash "$0" "$@"
    exit 0
fi