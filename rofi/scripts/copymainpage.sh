#!/bin/bash

main_page=$(cat ~/.config/rofi/scripts/credentials/mainpage)
echo -ne $main_page | tr -d '\n' | xclip -selection clipboard

notify-send "SYSTEM" "Main Page <b>$main_page</b> copiado en el portapapeles"
