#!/bin/bash

echo -ne "$target"
target=$(cat ~/.config/eww/scripts/target)
echo -ne $target | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard

notify-send "SYSTEM" "IP TARGET copiada en el portapapeles"
