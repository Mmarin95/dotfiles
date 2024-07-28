#/bin/sh
# This script will change the brightness of the screen using xrandr.
# Usage: brightness.sh [up|down] [step]

MIN_BRIGHTNESS=0.1
MAX_BRIGHTNESS=1.0

CURRENT_BRIGHTNESS=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ')
ACTION=$1
STEP=$2

if [ -z $STEP ]; then
    STEP=0.1
fi

if [ -z $ACTION ]; then
    echo "Usage: brightness.sh [up|down] [step]"
    exit 1
fi

if [ $ACTION = "up" ]; then
    NEW_BRIGHTNESS=$(echo $CURRENT_BRIGHTNESS + $STEP | bc)
elif [ $ACTION = "down" ]; then
    NEW_BRIGHTNESS=$(echo $CURRENT_BRIGHTNESS - $STEP | bc)
else
    echo "Usage: brightness.sh [up|down] [step]"
    exit 1
fi

if [ $(echo "$NEW_BRIGHTNESS < $MIN_BRIGHTNESS" | bc) -eq 1 ]; then
    NEW_BRIGHTNESS=$MIN_BRIGHTNESS
elif [ $(echo "$NEW_BRIGHTNESS > $MAX_BRIGHTNESS" | bc) -eq 1 ]; then
    NEW_BRIGHTNESS=$MAX_BRIGHTNESS
fi

xrandr --output eDP-1 --brightness $NEW_BRIGHTNESS
exit 0
