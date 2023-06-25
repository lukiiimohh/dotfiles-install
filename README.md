## <img src="/icons/espana.png" width="25px"/>
<details>
<summary>README en Español</summary>

<h1 align="center">
  <img width=25px src=icons/linux-tux.png>
  LUK DOTFILES
</h1>

<div align="center">
  
**_Con script autoinstaller & basados en AlphaTechnolog_**

<div align="left">

## Información ℹ️

Detalles sobre el setup:

<img src="icons/neofetch.png" align="right" width="550px"/>

- **OS:** [Arch Linux](https://archlinux.org)
- **WM:** [bspwm](https://github.com/baskerville/bspwm)
- **Terminal:** [kitty](https://sw.kovidgoyal.net/kitty/)
- **Shell:** bash
- **Editor:** [neovim](https://github.com/neovim/neovim)
- **Compositor:** [picom](https://github.com/yshui/picom)
- **Application Launcher:** [rofi](https://github.com/davatorium/rofi)

## Leer 📖
<details>
<summary>📖📖📖</summary>  

**Generales**  
Recomiendo leer el README entero.
Una vez tengas el entorno instalado ya sea con el script o sin él, te recomiendo mirar todos los alias y funciones del archivo `.zshrc` en `/home/$USER/.zshrc`.  
También te recomiendo leer los atajos de teclado definidos en el `sxhkdrc` en `~/.config/sxhkd/sxhkdrc`.  
Si vas a usar `archinstall` para instalar Arch y así probar el entorno te recomiendo esta configuración de `archinstall`
<img src="icons/archinstall.png" width="550px"/>
  
**Si usas el script**  
Debes ajustarte a los parámetros que se especifican antes de iniciar el script.  
El script tarda más o menos depende de tu conexión a internet, debido a que tiene que descargar cosas externas al repositorio.  
  
**Al finalizar el script**  
Asegurate de haber escogido bspwm en el gestor de ventanas de tu sistema.
La primera vez que inicies `nvim` va a dar un error, solo presiona `ENTER` y ya no volverá a suceder.
Puedes borrar de tu `/home/$USER` todo lo relacionado a `dotfiles-install`.  
Si quieres que todo lo relacionado a copiar y pegar IP's funcione debes mirar tanto `~/.config/eww/scripts` como `~/.config/rofi/scripts`.

**AÑADIDO DESPUÉS**
Los dotfiles estan hechos en gnome, así que si vais a instalar Arch con `archinstall`, debereís de seleccionar gnome. Yo uso gnome para la pantalla de bloqueo y algunas cosas útiles que trae gnome. Una vez que ya tengais instalado Arch y gnome, debeis entrar en una consola y ejecutar el script de instalación, una vez que el script haya terminado, simplemente hay que reiniciar la máquina y a la hora de loguearse a tu usuario, en gnome aparece una rueda dentada en la esquina inferiror derecha, dar click ahí y seleccionar `bspwm` .

</details>

## Requerimientos ❗

<details>
<summary>❗❗❗</summary>

**Abre la terminal y copia estas líneas:**

---
 
### [<img width="15px" src="icons/arch-linux-icon.png" />rch](lukinstaller.sh)-like 
    
**Script pensado para que lo ejecutes tras haber instalado ARCH y tengas un mínimo de una consola y el paquete GIT**

#### Primeros requerimientos

```sh
sudo pacman -Sy --noconfirm git
```
</details>

    
## Uso 🚀
<details>
<summary>🚀🚀🚀</summary>

```sh
# No ejecutes el script con sudo, te pedirá la contraseña cuando la necesita
cd /home/$USER
git clone https://github.com/lukiiimohh/dotfiles-install.git
cd ~/dotfiles-install/
chmod +x lukinstaller.sh
./lukinstaller.sh
# No omitas el paso del chmod +x lukinstaller.sh y trates de ejecutarlo con bash lukinstaller.sh (puede dar problemas).  
```

</details>

## Paquetes Instalados 📦
<details>
<summary>📦📦📦</summary>
<div align="center"> 
  
### <img width="15px" src="icons/arch-linux-icon.png" />rch

| Navegadores    | Aplicaciones de terminal | Herramientas de desarrollo | Personalización | Control de hardware | Interfaz gráfica |
|----------------|-------------------------|---------------------------|------------------|----------------------|------------------|
| Firefox        | Kitty                    | Git                        | Rofi               | Wireless_tools        | Gtk3              |
|                | Bspwm                    | Wget                       | Zsh                | Acpi                  | Gtk-layer-shell   |
|                | Sxhkd                    | Curl                       | Bat                | Acpid                 | Pango             |
|                | Picom                    | Rustup                     | Starship           | Xcursor-themes        | Gdk-pixbuf2       |
|                | Feh                      | JQ                         | Lsd                | Lxappearance          | Cairo             |
|                | Bat                      |                            | Neofetch           | Xcursor-flatbed       | Glib2             |
|                | Exa                      |                            | Xclip              | Locate                | GCC-libs          |
|                | Dunst                    |                            | Vim                | Flameshot             | Glibc             |
|                | Rofi                     |                            | Neovim             | Pavucontrol           |                   |
|                | Playerctl                |                            |                    | Gpick                 |                   |

</details>

<div align="left">

## Atajos de ⌨️
<details>
<summary>⌨️⌨️⌨️</summary>  

| **Atajo** | **Acción** |
|--------------|-------------|
|super + shift + return|Abrir rofi|
|super + m|Mostrar barra EWW|
|super + f|Abrir Firefox|
|super + x|Abrir el color picker|
|super + @space|Hacer una ventana `tile` > `floating`
|super + t|Hacer una ventana `floating` > `tile`|
|super + alt + {Left,Up,Down,Right}|Cambiar el tamaño a una ventana|
|super + shift + ctrl + {Left,Up,Down,Right}|Mover una ventana flotante|
|super + escape|Reiniciar sxhkd|
|super + shift + q|Quitar bspwm|
|super + shift + r|Reiniciar bspwm|
|super + q|Cerrar ventana|
|super + shift + y|Abrir menú personalizado rofi|
|super + ctrl + {Left,Right}|Moverse entre escritorios|
|shift + {Left,Up,Down,Right}|Moverse en los menús de la rofi|

</details>

## Extra 😎

<details>
<summary>😎😎😎</summary>

En el entorno hay una herramienta que permite el ricing con multitemas, la herramienta la puedes ejecutar con:
```sh
themer -h
```
</details>
  
## Galería 📸
<img src="/icons/tolascosas.jpg" />
<img src="/icons/rofi.jpg" />

## AutoInstaller 📋
El autoinstaller solo ha sido puesto en prueba en las siguientes condiciones: 
 - VMWare Workstation Pro 16 / Usando la .iso de los repositorios oficiales de ARCH. Además de que se ha probado teniendo instalado el entorno gráfico de GNOME DESKTOP.  
 - Sistema Nativo, usando ARCHINSTALL y con la .iso de los repositorios oficiales de ARCH. Entorno gráfico GNOME DESKTOP.  
  
Si alguien está dispuesto a probarlo en nativo/otro tipo de configuraciones que me notifique en discord `lukiiimohh#0633` ¡para así ir pudiendo actualizar esta parte!

## Gracias a 😁
- [alpha](https://github.com/AlphaTechnolog)
- y todos los demás ayudantes de los dotfiles originales...

</details>

## <img src="/icons/reino-unido.png" width="25px"/>
<details>
<summary>English README</summary>
  
<h1 align="center">
  <img width=25px src=icons/linux-tux.png>
  LUK DOTFILES
</h1>

<div align="center">
  
**_With autoinstaller script & based in AlphaTechnolog_**

<div align="left">

## Information ℹ️

Details about the setup:

<img src="icons/neofetch.png" align="right" width="550px"/>

- **OS:** [Arch Linux](https://archlinux.org)
- **WM:** [bspwm](https://github.com/baskerville/bspwm)
- **Terminal:** [kitty](https://sw.kovidgoyal.net/kitty/)
- **Shell:** bash
- **Editor:** [neovim](https://github.com/neovim/neovim)
- **Compositor:** [picom](https://github.com/yshui/picom)
- **Application Launcher:** [rofi](https://github.com/davatorium/rofi)

## Read 📖
<details>
<summary>📖📖📖</summary>  

**General**  
I recommend reading the entire README.
Once your have the dotfiles installed with script or without it, I recommend you to look all the aliases and functions from `.zshrc` in `/home/$USER/.zshrc`.  
Also I recommend you to read al the shortcuts defined in `sxhkdrc` in `~/.config/sxhkd/sxhkdrc`.  
If you are going to use `archinstall` to install Arch and give a try to the dotfiles I would recommend you this configuration.
<img src="icons/archinstall.png" width="550px"/>
  
**If you use the script**  
You shall have in consideration all the parameters specified at the start of the script.  
The script will late more or less depending on your connection, because it have to download external things.  
  
**When you finish the script**  
Be aware of choosing `BSPWM` as window manager.
The first time you start `nvim` it is going to give an error, just press `ENTER` and it wont happen again.
You can delete from your `/home/$USER` all in relation to `dotfiles-install`.  
If you want to understand all about the `IP MENU'S` you should look in `~/.config/eww/scripts` and `~/.config/rofi/scripts`.

**ADDED LATER + INFO TO KNOW**
This dotfiles are gnome based, so in if you run `archinstall` you should select gnome, I just used gnome for the lockscreen and another cool stuff gnome had and it was easy to deal with. But once you have gnome installed you need to run the script, only when you have already gnome installed, once you've done this, you reboot the machine and select in the cogwheel `bspwm`.

</details>

## Requirements ❗

<details>
<summary>❗❗❗</summary>

**Open the terminal and copy this line:**

---
 
### [<img width="15px" src="icons/arch-linux-icon.png" />rch](lukinstaller.sh)-like 
    
**The script is made to be executed after having installed `ARCH` a terminal and the `GIT` package**

#### First Requirements

```sh
sudo pacman -Sy --noconfirm git
```
</details>

    
## Use 🚀
<details>
<summary>🚀🚀🚀</summary>

```sh
# Don't run the script as root, it will request your password when needed
cd /home/$USER
git clone https://github.com/lukiiimohh/dotfiles-install.git
cd ~/dotfiles-install/
chmod +x lukinstaller.sh
./lukinstaller.sh
# Don't omit the chmod +x lukinstaller.sh step and try to install it with bash lukinstaller.sh (Probably it will fail).  
```

</details>

## Installed Packages 📦
<details>
<summary>📦📦📦</summary>
<div align="center"> 
  
### <img width="15px" src="icons/arch-linux-icon.png" />rch

| Navigators    | Terminal applications | Development Tools | Personalization | Hardware Control | Graphic Interface |
|----------------|-------------------------|---------------------------|------------------|----------------------|------------------|
| Firefox        | Kitty                    | Git                        | Rofi               | Wireless_tools        | Gtk3              |
|                | Bspwm                    | Wget                       | Zsh                | Acpi                  | Gtk-layer-shell   |
|                | Sxhkd                    | Curl                       | Bat                | Acpid                 | Pango             |
|                | Picom                    | Rustup                     | Starship           | Xcursor-themes        | Gdk-pixbuf2       |
|                | Feh                      | JQ                         | Lsd                | Lxappearance          | Cairo             |
|                | Bat                      |                            | Neofetch           | Xcursor-flatbed       | Glib2             |
|                | Exa                      |                            | Xclip              | Locate                | GCC-libs          |
|                | Dunst                    |                            | Vim                | Flameshot             | Glibc             |
|                | Rofi                     |                            | Neovim             | Pavucontrol           |                   |
|                | Playerctl                |                            |                    | Gpick                 |                   |

</details>

<div align="left">

## Shortcuts ⌨️
<details>
<summary>⌨️⌨️⌨️</summary>  

| **Shortcut** | **Action** |
|--------------|-------------|
|super + shift + return|Opens rofi|
|super + m|Show EWW|
|super + f|Opens Firefox|
|super + x|Opens color picker|
|super + @space|Make windows `tile` > `floating`
|super + t|Make windows `floating` > `tile`|
|super + alt + {Left,Up,Down,Right}|Windows Resize|
|super + shift + ctrl + {Left,Up,Down,Right}|Move a floating window|
|super + escape|Restart sxhkd|
|super + shift + q|Quit bspwm|
|super + shift + r|Restart bspwm|
|super + q|Close window|
|super + shift + y|Opens custom rofi menu|
|super + ctrl + {Left,Right}|Switch between workspaces|
|shift + {Left,Up,Down,Right}|Switch between rofi menus|

</details>

## Extra 😎

<details>
<summary>😎😎😎</summary>

In the dotfiles there is a multiricing tool that you can execute with:
```sh
themer -h
```
</details>
  
## Gallery 📸
<img src="/icons/tolascosas.jpg" />
<img src="/icons/rofi.jpg" />

## AutoInstaller 📋
The script have been tried in this cases: 
 - VMWare Workstation Pro 16 / Using the .iso from official ARCH repositories. With the graphical environment GNOME DESKTOP.  
 - Native System, using ARCHINSTALL and with the .iso from official ARCH repositories. With the graphical environment GNOME DESKTOP.  
  
If someone is interested on trying the script with anothe configuration notify me on discord `lukiiimohh#0633`

## Thanks to 😁
- [alpha](https://github.com/AlphaTechnolog)
- and all the originals helpers...
  
</details>
