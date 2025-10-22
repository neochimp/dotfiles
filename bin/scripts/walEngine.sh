#!/bin/bash
FILE="/home/soup/.config/wallpapers/$1"

if [ -f "$FILE" ]; then
  printf "preload = $FILE\nwallpaper = ,$FILE" >.config/hypr/hyprpaper.conf
  WAL=$(/bin/wal -i "$FILE")
  echo "$WAL"

  killall hyprpaper
  killall waybar
  sleep 1
  hyprpaper &
  waybar &
  pywal-spicetify text &
  pywalfox update &
  ${HOME}/.config/mako/update-theme.sh &

else
  echo "$FILE does not exist"
fi
