#!/bin/bash
DIR="/home/soup/.config/wallpapers"
SCALE="0.25"

Help() {
  echo "This script is used to change the wallaper and themes"
  echo
  echo "Syntax: wallpaper [name of file]"
  echo "Options:"
  echo "h   Print this help message."
  echo "l   List out available files in wallpaper directory"
  echo "L   (WIP)Preview all photos in folder (kitty terminal) "
}

##WORK IN PROGRESS
Preview() {

  local width=40
  local height=20
  local ypos=20

  echo "Previewing Photos in: $DIR"
  for img in "$DIR"/*.jpg "$DIR"/*.png; do
    [ -f "$img" ] || continue #skip if no matches
    echo "---- ${img##*/} ----"
    kitty +kitten icat --place "${width}x${height}@0x${ypos}" "$img"
    ypos=$((ypos + height + 2))
    echo ""
  done
}

while getopts "hlL" opt; do
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
  L) #WIP
    Preview
    exit 0
    ;;
  esac
done

FILE="$DIR/$1"
if [ -f "$FILE" ]; then
  #old version
  #printf "preload = $FILE\nwallpaper = $FILE" >.config/hypr/hyprpaper.conf

  #new version
  printf "wallpaper {\n\tmonitor = \n\tpath = $FILE\n\tfit_mode = cover\n}" >.config/hypr/hyprpaper.conf
  WAL=$(/bin/wal -i "$FILE")
  echo "$WAL"

  killall hyprpaper
  killall waybar
  sleep 1
  hyprpaper &
  waybar -c ~/.config/waybar/config &
  #sleep 0.5
  #waybar -c ~/.config/waybar/config2 &
  pywal-spicetify text &
  spicetify backup apply &
  pywalfox update &
  ${HOME}/.config/mako/update-theme.sh &

else
  echo "$FILE does not exist"
fi
