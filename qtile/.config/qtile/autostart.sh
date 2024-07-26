#!/bin/sh
udiskie&
dunst&
picom -b
ibus-daemon -rxRd

xrandr --output eDP-1 --brightness 0.8
