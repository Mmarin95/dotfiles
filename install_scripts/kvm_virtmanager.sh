#!/usr/bin/env bash

# Install KVM and Virt-Manager
sudo apt install qemu-system libvirt-daemon-system

# Lighter installation
# sudo apt install --no-install-recommends qemu-system libvirt-clients libvirt-daemon-system

# Add user to libvirt group
sudo adduser $USER libvirt

# Try list domains
virsh list --all

# Install Virt-Manager
sudo apt install virt-manager
