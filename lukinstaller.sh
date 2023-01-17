#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
blackColour="\e[0;30m\033[1m"

function ctrl_c(){
    echo -e "\n\n${redColour}[!] Saliendo...\n${endColour}"
    tput cnorm; exit 1
}

# CTRL + C
trap ctrl_c INT

#Si es root salimos
if [ "$(whoami)" == "root" ]; then
  echo -e "\n${redColour}[!] No puedes estar como root${endColour}" && exit 1; tput cnorm
fi

USER=$(whoami)

#Quitamos el raton
tput civis

#Limpiamos la terminal
clear

#Damos la introducción al programa
echo -e "\n${greenColour}[+]${endColour} ${grayColour}Bienvenido a la Instalación de mis dotfiles (luk), están inspirados en${endColour} ${blueColour}https://github.com/AlphaTechnolog/dotfiles/tree/bspwm${endColour}"
sleep 2
echo -e "\t\n${redColour}[!] RECUERDA QUE PARA INSTALAR ESTOS DOTFILES TIENES QUE:${endColour}"
echo -e "\n\t${purpleColour}- ${endColour}${grayColour}Tener el repositorio de mi github ${blueColour}https://github.com/lukiiimohh/dotfiles-install.git${endColour} ${grayColour}clonado en tu${endColour} ${blueColour}/home/$USER${endColour}"
echo -e "\n\t${purpleColour}- ${endColour}${grayColour}Tienes que estar relativamente atento, a pesar de estar automatizado hay puntos en los que pide tu contraseña"
sleep 10
echo -e "\t\n${redColour}[!] Si no cumples con estos requisitos haz CTRL+C y ajustate a los mismos, luego vuelve a correr el script. Tienes 15 segundos."
sleep 15

#################### COMENZAMOS

#Instalamos-con-pacman-lo-necesario
sudo pacman -S firefox kitty bspwm sxhkd picom starship feh bat exa dunst rofi playerctl light brightnessctl pamixer xdotool git wget curl rustup rofi zsh lsd bat starship vim neovim neofetch xclip jq wireless_tools acpi acpid xcursor-themes lxappearance xcursor-flatbed locate flameshot pavucontrol gpick figlet lolcat gtk3 gtk-layer-shell pango gdk-pixbuf2 cairo glib2 gcc-libs glibc --needed --noconfirm
echo -e "\n${greenColour}[+]${endColour} ${grayColour}Paquetes de Pacman${endColour}"

#Instalamos-paru
mkdir -p ~/Desktop/$USER/repos
cd !$
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si --noconfirm
echo -e "\n${greenColour}[+]${endColour} ${grayColour}Paru Instalado${endColour}"

#Intalamos-repos-de-blackarch
cd ~/Desktop/$USER/repos/blackarch
cd !$
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
echo -e "\n${greenColour}[+]${endColour} ${grayColour}Repositorios de BlackArch${endColour}"

#Instalamos-con-paru-lo-necesario
paru -S zsh-autosuggestions zsh-syntax-highlighting alsa-utils alsa-tools pulseaudio lm_sensors mpd mpc mpdris2 ncmpcpp playerctl js-beautify fzf papirus-icon-theme cava --needed --noconfirm
echo -e "\n${greenColour}[+]${endColour} ${grayColour}Paquetes de Paru${endColour}"

#Instalamos-los-dotfiles
#cd
#git clone https://github.com/lukiiimohh/dotfiles-install.git
#cd dotfiles-install/
#echo -e "\n${greenColour}[+]${endColour} ${grayColour}Dotfiles clonados${endColour}"

#Intalamos-bspwm-y-sxhkd
rm -rf ~/.config/bspwm; mv ~/dotfiles-install/bspwm ~/.config/
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/*
rm -rf ~/.config/sxhkd; mv ~/dotfiles-install/sxhkd ~/.config/
chmod +x ~/.config/sxhkd/sxhkdrc
echo -e "\n${greenColour}[+]${endColour} ${grayColour}BSPWM y SXHKD Instalados${endColour}"

#Instalamos-eww
paru -S eww --needed --noconfirm
echo -e "\n${greenColour}[+]${endColour} ${grayColour}EWW Instalado${endColour}"

#Copiamos-archivos-necesarios

echo -e "\n${greenColour}[+]${endColour} ${grayColour}Copiamos todos los archivos necesarios...${endColour}"

#Zshrc
cd ~/dotfiles-install/
mv zshrc .zshrc
mv .zshrc ~
sudo ln -s ~.zshrc /root/

#Kitty
rm -rf ~/.config/kitty; mv ~/dotfiles-install/kitty ~/.config/

#Starship
rm ~/.config/starship.toml; mv ~/dotfiles-install/starship.toml ~/.config/
mv starship-root.toml starship.toml
sudo mkdir -p /root/.config/
sudo rm /root/.config/starship.toml; sudo mv ~/dotfiles-install/starship.toml /root/.config/

#Themes
rm -rf ~/.config/themes; mv ~/dotfiles-install/themes ~/.config

#Iosevka-Nerd-Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Iosevka.zip
unzip Iosevka.zip -d iosevka
sudo mkdir /usr/share/fonts/Iosevka
sudo cp ~/dotfiles-install/iosevka/*.ttf /usr/share/fonts/Iosevka
sudo fc-cache -fv

#Fondo-de-pantalla
mkdir -p ~/.Wallpapers
cp ~/.config/bspwm/wallpapers/wallpaper.jpg .Wallpapers
mv ~/.Wallpapers/wallpaper.jpg ~/.Wallpapers/mortynoon.jpg
feh --no-fehbg --bg-scale '~/.config/bspwm/wallpapers/wallpaper.jpg'

#Rofi
rm -rf ~/.config/rofi; mv ~/dotfiles-install/rofi ~/.config
chmod +x ~/.config/rofi/scripts/*
chmod 644 ~/.config/rofi/scripts/ipselector.json; chmod 644 ~/.config/rofi/scripts/menugeneral.json

#Picom
rm -rf ~/.config/picom; mv ~/dotfiles-install/picom ~/.config

#Nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
rm -rf ~/.config/nvim; mv ~/dotfiles-install/nvim ~/.config

#Neofetch
rm -rf ~/.config/neofetch; mv ~/dotfiles-install/neofetch ~/.config

#Cava
rm -rf ~/.config/cava; mv ~/dotfiles-install/cava ~/.config

#Bins-personalizados
rm -rf ~/.config/bin; mv ~/dotfiles-install/bin ~/.config
chmod +x ~/.config/bin/*

#Dunst
rm -rf ~/.config/dunst; mv ~/dotfiles-install/dunst ~/.config

echo -e "\n${greenColour}[+]${endColour} ${grayColour}Archivos copiados${endColour}"

#Plugin-sudo-zsh
sudo mkdir -p /usr/share/zsh-sudo
cd !$
cd ..
sudo chown $USER: $USER zsh-sudo/
cd !$
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

echo -e "\n\t${greenColour}[+]${endColour} ${grayColour}ENTORNO LISTO${endColour}"

echo -e "\n\t\t${greenColour}${endColour} ${grayColour}Recuerda hacer inmediatamente un ${yellowColour}REBOOT${endColour} ${grayColour}al sistema y arrancar en el siguiente inicio con el gestor de ventanas${endColour} ${blueColour}BSPWM${endColour}"
echo -e "\t\t${grayColour}Si tienes alguna duda puedes contactar conmigo en discord${endColour} ${blueColour}lukiiimohh#0633${endColour}\n"

#Recuperamos el cursor si todo ha ido bien
tput cnorm
