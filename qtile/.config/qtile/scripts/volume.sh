#!/bin/bash
# Change volume using wpctl and show a notification

msgTag="myvolume"
minVolume=0
maxVolume=1.50
maxVolumeScaled=150
volumeStep=0.05

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}'
}

is_muted() {
    # Grep -q suppresses output
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}' | grep -q "\[MUTED\]"
    # echo $? returns last command exit status 
    # 0 for success, otherwise error
    # if is_muted equals 0 then "[MUTED]" is found
    echo $?
}

unmute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
}

mute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
}

set_volume() {
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$1"
}

scale_volume_to_max_volume() {
    # if volume is 0.75, then scaled is 75
    scaled=$(echo "$1 * 100" | bc -l | awk '{printf "%d\n", $1}')
    # if scaled is 75 in 0to100, then scaledVolume is 50 in 0to150 
    echo "($scaled / $maxVolumeScaled) * 100" | bc -l | awk '{printf "%d\n", $1}'
}

case $1 in
    "up")
        currentVolume=$(get_volume)
        if [[ $(is_muted) -eq 0 ]]; then
            unmute
        fi
        newVolume=$(echo "$currentVolume + $volumeStep" | bc)
        if (( $(echo "$newVolume > $maxVolume" | bc -l) )); then
            newVolume=$maxVolume
        fi
        set_volume "$newVolume"
        ;;
    "down")
        currentVolume=$(get_volume)
        if [[ $(is_muted) -eq 0 ]]; then
            unmute
        fi
        newVolume=$(echo "$currentVolume - $volumeStep" | bc)
        if (( $(echo "$newVolume < $minVolume" | bc -l) )); then
            newVolume=$minVolume
            mute
        fi
        set_volume "$newVolume"
        ;;
    "toggle")
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    *)
        echo "Usage: $0 {up|down|toggle}"
        exit 1
        ;;
esac

info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(echo "$info" | awk '{print $2}')
mute=$(echo "$info" | awk '{print $3}')

# Scale volume for display
# scaled=$(echo "$volume * 100" | bc -l | awk '{printf "%d\n", $1}')
# scaledVolume=$(echo "($scaled / $maxVolumeScaled) * 100" | bc -l | awk '{printf "%d\n", $1}')
scaledVolume=$(scale_volume_to_max_volume $volume)

if [[ "$mute" == "[MUTED]" ]]; then
    echo "Volume muted"
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h "string:x-dunst-stack-tag:$msgTag" "Volume muted" 
else
    dunstify -a "changeVolume" -u low -i audio-volume-high -h "string:x-dunst-stack-tag:$msgTag" -h int:value:"$scaledVolume" "Volume: ${scaledVolume}%"
fi

canberra-gtk-play -i audio-volume-change -d "changeVolume"
