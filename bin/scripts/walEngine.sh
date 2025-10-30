#!/bin/bash
DIR="/home/soup/.config/wallpapers"

Help() {
  echo "This script is used to change the wallaper and themes"
  echo
  echo "Syntax: wallpaper [name of file]"
  echo "Options:"
  echo "h   Print this help message."
  echo "l   List out available files in wallpaper directory"
}

while getopts "hl" opt; do
  case $opt in
  h) # Display Help
    Help
    exit 0
    ;;
  l)
    echo "Available files"
    ls "$DIR"*.jpg "DIR"*.png /home/soup/.config/wallpapers/ 2>/dev/null
    exit 0
    ;;
  esac
done

FILE="$DIR/$1"
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
