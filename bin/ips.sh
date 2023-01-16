#!/bin/bash

figlet "IP's" | lolcat
ip addr show | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | sed -e "s/^/\x1B[31;1mIP PRIVADA: \x1B[0m/"
curl -s http://icanhazip.com | sed -e "s/^/\x1B[32;1mIP PÚBLICA: \x1B[0m/"
ss -tulpn | grep -Eo '([0-9]*\.){3}[0-9]*:[0-9]*' | tr '\n' ',' | sed -e "s/^/\x1B[33;1mPUERTOS +: \x1B[0m/"
