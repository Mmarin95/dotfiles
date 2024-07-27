#!/bin/sh
udiskie&
dunst&
picom -b
ibus-daemon -rxRd

xrandr --output eDP-1 --brightness 0.8

# Start $USER session so tmux is already loaded
tmux new-session -d -s $USER
