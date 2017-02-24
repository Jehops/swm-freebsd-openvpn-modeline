#!/bin/sh

interval=15 # customize this
stump_pid="$(pgrep -a -n stumpwm)"

# while stumpwm is still running
while kill -0 "$stump_pid" > /dev/null 2>&1; do
    if service openvpn onestatus | grep -q 'openvpn is running'; then
        printf "!\n"
    else
        printf " \n"
    fi
    sleep "$interval"
done
