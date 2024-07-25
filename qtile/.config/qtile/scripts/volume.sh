#!/bin/bash
# The script will be able to mute toggle, raise and lower the volume of the system using pactl
# Usage volume.sh [set|toggle|up|down] [step]
# TODO: Add dunst notifications
# TODO: Add sound feedback

action=$1
step=$2

if [ -z $step ]; then
    step=5
fi

MAX_VOLUME=130
MIN_VOLUME=0
current=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)


case $action in
    toggle)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    set)
        pactl set-sink-volume @DEFAULT_SINK@ $step%

        if [ $step -gt $MAX_VOLUME ]; then
            pactl set-sink-volume @DEFAULT_SINK@ $MAX_VOLUME%
            echo "Volume set to $MAX_VOLUME%"
            exit 0
        fi

        if [ $step -lt $MIN_VOLUME ]; then
            pactl set-sink-volume @DEFAULT_SINK@ $MIN_VOLUME%
            echo "Volume set to $MIN_VOLUME%"
            exit 0
        fi

        if [ $step -eq 0 ]; then
            pactl set-sink-mute @DEFAULT_SINK@ 1
        else
            pactl set-sink-mute @DEFAULT_SINK@ 0
        fi
        ;;
    up)
        new_volume=$(($current + $step))
        if [ $new_volume -gt $MIN_VOLUME ]; then
            pactl set-sink-mute @DEFAULT_SINK@ 0
        fi
        if [ $new_volume -gt $MAX_VOLUME ]; then
            new_volume=$MAX_VOLUME
            exit 0
        fi
        pactl set-sink-volume @DEFAULT_SINK@ +$step%
        ;;
    down)
        new_volume=$(($current - $step))
        if [ $new_volume -lt $MIN_VOLUME ]; then
            new_volume=$MIN_VOLUME
            pactl set-sink-mute @DEFAULT_SINK@ 1
            exit 0
        fi
        pactl set-sink-volume @DEFAULT_SINK@ -$step%
        ;;
    *)
        echo "Usage: volume.sh [set|toggle|up|down] [step]"
        ;;
esac

