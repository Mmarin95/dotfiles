#!/bin/sh
udiskie&
dunst&
picom -b

xrandr --output eDP-1 --brightness 0.8
