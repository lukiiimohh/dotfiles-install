#!/bin/bash

ipvpn=$(ip addr show dev tun0 | grep "inet" | awk 'NR==1 {print $2}' | awk -F "/" '{print $1}')
echo -ne $ipvpn | xclip -selection clipboard

notify-send "SYSTEM" "IP VPN copiada en el portapapeles"
