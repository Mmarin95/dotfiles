#!/usr/bin/env bash

# Add user to sudo group, since debian doesn't add user to sudo group by default
su - root -c "usermod -aG sudo $USER"
