#!/usr/bin/env bash

# Install Flatpak
sudo apt install flatpak -y

# if gnome install gnome-software-plugin-flatpak
if [ -n "$(which gnome-shell)" ]; then
    sudo apt install gnome-software-plugin-flatpak -y
fi

# Add Flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
