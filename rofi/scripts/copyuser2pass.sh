#!/bin/bash

user2creds=$(cat ~/.config/rofi/scripts/credentials/user2creds)
user2pass=$(cat ~/.config/rofi/scripts/credentials/user2creds | awk '{print $2}' | tr -d '\n')
echo -ne $user2creds | awk '{print $2}' | tr -d '\n' | xclip -selection clipboard

notify-send "SYSTEM" "User 2 Pass <b>$user2pass</b> copiado en el portapapeles"
