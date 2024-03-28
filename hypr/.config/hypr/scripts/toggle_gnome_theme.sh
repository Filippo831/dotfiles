#!/bin/bash

# Check current GNOME settings
current_theme=$(gsettings get org.gnome.desktop.interface color-scheme)

echo "ciao"

# If current theme is set to light, switch to dark, and vice versa
if [ "$current_theme" == "'prefer-light'" ]; then
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    echo 'dark'
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    echo 'light'
fi

