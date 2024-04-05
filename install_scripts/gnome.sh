#!/usr/bin/env bash

# Install GNOME extensions manager
sudo apt install gnome-shell-extension-manager -y

# Echo to install caffeine extension with gnome-shell-extensions-manager
echo "Please install caffeine extension with gnome-shell-extensions-manager"
echo "Pleade install clipboard indicator extension with gnome-shell-extensions-manager"

# Install GNOME Tweaks
sudo apt install gnome-tweaks -y

# Remove the games
sudo apt remove gnome-games
sudo apt autoremove
