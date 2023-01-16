#!/bin/bash

user2creds=$(cat ~/.config/rofi/scripts/credentials/user2creds)
user2user=$(cat ~/.config/rofi/scripts/credentials/user2creds | awk '{print $1}' | tr -d '\n')
echo -ne $user2creds | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard

notify-send "SYSTEM" "User 2 <b>$user2user</b> copiado en el portapapeles"
