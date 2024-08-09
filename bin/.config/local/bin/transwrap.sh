#!/bin/bash

# This script starts and stop transmission-daemon with params start/stop

if [ "$1" == "start" ]; then
    echo "Starting transmission-daemon..."
    echo "http://localhost:9091"
    echo "For web interface."
    killall transmission-daemon 2> /dev/null
	transmission-daemon --foreground --log-info 2>&1 | while read line; do
		echo "$line" |
			grep -v "announcer.c:\|platform.c:\|announce done (tr-dht.c:" |
			grep -v "Saved.*variant.c:" |
			while read line; do
				echo "$line" | grep -q "Queued for verification (verify.c:" &&
					notify-send --app-name="Transmission Started" "${line#* * }"
				echo "$line" | grep -q "changed from .Incomplete. to .Complete." &&
					notify-send --app-name="Transmission Complete" "${line#* * }"
				echo "$line" | systemd-cat --identifier="TransWrap" --priority=5
			done 2>&1 > /dev/null
		done&disown
elif [ "$1" == "stop" ]; then
    echo "Stopping transmission-daemon..."
    killall transmission-daemon
else
    echo "Usage: $0 start|stop"
fi

