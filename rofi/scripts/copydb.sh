#!/bin/bash

db_user_creds=$(cat ~/.config/rofi/scripts/credentials/db_user_creds)
echo -ne $db_user_creds | tr -d '\n' | xclip -selection clipboard

notify-send "SYSTEM" "DB Credentials <b>$db_user_creds</b> copiado en el portapapeles"
