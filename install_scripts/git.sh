#!/usr/bin/env bash

# Install git
sudo apt install git -y

# Install gh
sudo apt install gh -y

# asl to log in to gh
echo "Do you want to log in to gh now? (y/n)"
read gh_login

if [ "$gh_login" = "y" ]; then
    gh auth login
fi
