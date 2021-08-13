#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     Type: Shell Script
#     E-mail: leoncesaralejandro@gmail.com
#     Date: August, the 8th/ 2021
#     Description: WINDOW MANAGER INSTALL
#################################################

# Install wget and zsh
sudo pacman -S --noconfirm wget zsh

# Change default user shell to zsh
sudo usermod -s /bin/zsh cesar

# Install Oh-My-Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended
mkdir -p ~/.config/xmonad

# Install Window Manager and Display Manager
sudo pacman -S --noconfirm xorg

# Install without conflicts 
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter xmonad xmonad-contrib xmobar \
                dmenu picom nitrogen alacritty chromium linux-zen linux-zen-headers

# Copiar el archivo de configuracion a la carpeta correspondiente
cp ./xmonad.hs ~/.config/xmonad/xmonad.hs

sudo systemctl enable lightdm
xmonad --recompile
sudo systemctl start lightdm
