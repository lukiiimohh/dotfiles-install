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

#Instalamos de manera silenciosa lolcat para el logo
sudo pacman -S lolcat --needed --noconfirm > /dev/null 2>&1

echo -e "\n${greenColour}[+]${endColour} ${grayColour}Bienvenido a la Instalación de mis dotfiles${endColour}\n"
echo -e "88             88                88                               
88             88                88              ,d               
88             88                88              88               
88 88       88 88   ,d8  ,adPPYb,88  ,adPPYba, MM88MMM ,adPPYba,  
88 88       88 88 ,a8\"  a8\"    \`Y88 a8\"     \"8a  88    I8[    \"\"  
88 88       88 8888[    8b       88 8b       d8  88     \`\"Y8ba,   
88 \"8a,   ,a88 88\`\"Yba, \"8a,   ,d88 \"8a,   ,a8\"  88,   aa    ]8I  
88  \`\"YbbdP'Y8 88   \`Y8a \`\"8bbdP\"Y8  \`\" YbbdP\"   \"Y888 \`\"YbbdP\"" | lolcat -S -5
echo -e "                                       ${grayColour}by${endColour} ${blueColour}lukiiimohh${endColour}"
sleep 5;

#Damos la introducción al programa
echo -e "\n${grayColour}Están inspirados en${endColour} ${blueColour}https://github.com/AlphaTechnolog/dotfiles/tree/bspwm${endColour}"
sleep 3
echo -e "\t\n${redColour}[!] RECUERDA QUE PARA INSTALAR ESTOS DOTFILES TIENES QUE:${endColour}"
echo -e "\n\t${purpleColour}- ${endColour}${grayColour}Tener el repositorio de mi github ${blueColour}https://github.com/lukiiimohh/dotfiles-install.git${endColour} ${grayColour}clonado en tu${endColour} ${blueColour}/home/$USER/${endColour}"
echo -e "\n\t${purpleColour}- ${endColour}${grayColour}Tienes que estar relativamente atento, a pesar de estar automatizado hay puntos en los que pide tu contraseña"
sleep 10
echo -e "\t\n${redColour}[!] Si no cumples con estos requisitos haz CTRL+C y ajustate a los mismos, luego vuelve a correr el script. Tienes 15 segundos${endColour}"
sleep 15

#################### COMENZAMOS

#Actualizamos el sistema
sudo pacman -Syu --needed --noconfirm
echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}Sistema Actualizado${endColour}\n\n\n"; sleep 3

#Instalamos-paru
mkdir -p ~/Desktop/$USER/repos
git clone https://aur.archlinux.org/paru-bin.git ~/Desktop/$USER/repos/paru-bin
cd ~/Desktop/$USER/repos/paru-bin
makepkg -si --noconfirm
echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}Paru Instalado${endColour}\n\n\n"; sleep 3

#Instalamos-repos-de-blackarch
mkdir -p ~/Desktop/$USER/repos/blackarch
cd ~/Desktop/$USER/repos/blackarch
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}Repositorios de BlackArch${endColour}\n\n\n"; sleep 3

#Instalamos-con-paru-lo-necesario
paru -S zsh-autosuggestions zsh-syntax-highlighting alsa-utils alsa-tools pulseaudio lm_sensors mpd mpc mpdris2 ncmpcpp playerctl js-beautify fzf papirus-icon-theme cava --needed --noconfirm
echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}Paquetes de Paru${endColour}\n\n\n"; sleep 3

#Instalamos-los-dotfiles
#cd
#git clone https://github.com/lukiiimohh/dotfiles-install.git
#cd dotfiles-install/
#echo -e "\n${greenColour}[+]${endColour} ${grayColour}Dotfiles clonados${endColour}"

#Instalamos-con-pacman-lo-necesario
sudo pacman -S firefox kitty bspwm sxhkd picom starship feh bat exa dunst rofi playerctl light brightnessctl pamixer xdotool git wget curl rustup rofi zsh lsd bat starship vim neovim neofetch xclip jq wireless_tools acpi acpid xcursor-themes lxappearance xcursor-flatbed locate flameshot pavucontrol gpick figlet lolcat gtk3 gtk-layer-shell pango gdk-pixbuf2 cairo glib2 gcc-libs glibc --needed --noconfirm
echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}Paquetes de Pacman${endColour}\n\n\n"; sleep 3

#Intalamos-bspwm-y-sxhkd
rm -rf ~/.config/bspwm; mv ~/dotfiles-install/bspwm ~/.config/
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/*
rm -rf ~/.config/sxhkd; mv ~/dotfiles-install/sxhkd ~/.config/
chmod +x ~/.config/sxhkd/sxhkdrc
echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}BSPWM y SXHKD Instalados${endColour}\n\n\n"; sleep 3

#Instalamos-eww
paru -S eww --needed --noconfirm
echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}EWW Instalado${endColour}\n\n\n"; sleep 3

#Copiamos-archivos-necesarios

echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}Copiamos todos los archivos necesarios...${endColour}\n\n\n"; sleep 3

#Zshrc
cd ~/dotfiles-install/
mv zshrc .zshrc
mv .zshrc /home/$USER/
sudo ln -s /home/$USER/.zshrc /root/.zshrc

#Kitty
rm -rf ~/.config/kitty; mv ~/dotfiles-install/kitty ~/.config/

#Starship
rm ~/.config/starship.toml; mv ~/dotfiles-install/starship.toml ~/.config/
mv starship-root.toml starship.toml
chsh -s $(which zsh) $USER
sudo chsh -s $(which zsh) root
sudo mkdir -p /root/.config/
sudo mv ~/dotfiles-install/starship.toml /root/.config/

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

#EWW
rm -rf ~/.config/eww; mv ~/dotfiles-install/eww ~/.config
chmod +x ~/.config/eww/scripts/*; chmod 644 target
chmod +x ~/.config/eww/controls/toggle.sh

echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}Archivos copiados${endColour}\n\n\n"; sleep 3

#Plugin-sudo-zsh
sudo mkdir -p /usr/share/zsh-sudo
cd /usr/share/
sudo chown $USER:$USER zsh-sudo/
cd zsh-sudo/
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

echo -e "\n\n\n${greenColour}[+]${endColour} ${grayColour}ENTORNO LISTO${endColour}"; notify-send "LUKDOTS" "Ha acabado la descarga e instalación de LUKDOTS"

echo -e "\n\t${purpleColour}-${endColour} ${grayColour}Recuerda hacer inmediatamente un ${yellowColour}REBOOT${endColour} ${grayColour}al sistema y arrancar en el siguiente inicio con el gestor de ventanas${endColour} ${blueColour}BSPWM${endColour}"
echo -e "\t${purpleColour}-${endColour} ${grayColour}Si tienes alguna duda puedes contactar conmigo en discord${endColour} ${blueColour}lukiiimohh#0633${endColour}\n"

#Recuperamos el cursor si todo ha ido bien
tput cnorm
