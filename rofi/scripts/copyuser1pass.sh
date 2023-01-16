#!/bin/bash

user1creds=$(cat ~/.config/rofi/scripts/credentials/user1creds)
user1pass=$(cat ~/.config/rofi/scripts/credentials/user1creds | awk '{print $2}' | tr -d '\n')
echo -ne $user1creds | awk '{print $2}' | tr -d '\n' | xclip -selection clipboard

notify-send "SYSTEM" "User 1 Pass <b>$user1pass</b> copiado en el portapapeles"
