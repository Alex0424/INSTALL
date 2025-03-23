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