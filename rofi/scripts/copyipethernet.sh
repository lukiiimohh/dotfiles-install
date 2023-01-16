#!/bin/bash

ipvpn=$(ip addr show dev ens33 | grep inet | awk 'NR==1 {print $2}' | cut -d '/' -f 1)
echo -ne $ipvpn | xclip -selection clipboard

notify-send "SYSTEM" "IP ETHERNET copiada en el portapapeles"
