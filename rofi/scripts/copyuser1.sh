#!/bin/bash

user1creds=$(cat ~/.config/rofi/scripts/credentials/user1creds)
user1user=$(cat ~/.config/rofi/scripts/credentials/user1creds | awk '{print $1}' | tr -d '\n')
echo -ne $user1creds | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard

notify-send "SYSTEM" "User 1 <b>$user1user</b> copiado en el portapapeles"
