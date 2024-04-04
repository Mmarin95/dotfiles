#!/usr/bin/env bash

# Install Dracula GTK theme and icons

# Abort if it is already installed
if [ -d ~/.themes/Dracula ]; then
    echo "Dracula GTK theme is already installed"
    exit 0
fi

mkdir -p ~/.themes
mkdir -p ~/.icons

cd ~/.themes
wget https://github.com/dracula/gtk/archive/master.zip -O Dracula.zip
unzip -q Dracula.zip
mv gtk-master Dracula

gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"

cd ~/.icons
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
# unzip no verbose
unzip -q Dracula.zip

gsettings set org.gnome.desktop.interface icon-theme "Dracula"

echo "Enable user themes extension in GNOME Tweaks to apply the Dracula theme if it is not already enabled"

cd ~

# gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
# gsettings set org.gnome.desktop.wm.preferences theme "Adwaita"
# gsettings set org.gnome.desktop.interface icon-theme "Adwaita"
