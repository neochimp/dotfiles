#!/usr/bin/env bash
# Runs the given command only if the system is on battery (discharging)

battery=$(upower -e | grep 'battery_' | head -n1)
status=$(upower -i "$battery" | awk -F': *' '/state/ {print $2}')
echo $status
if [[ "$status" == "discharging" ]]; then
  "$@"
fi
