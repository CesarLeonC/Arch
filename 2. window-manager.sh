#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: INSTALL XMONAD WINDOW MANAGER
#################################################


# Update Ecuadorian mirorlist
sudo rm /etc/pacman.d/mirrorlist
sudo cp ~/Repositories/cesarleonc/Arch/configs/mirrorlist /etc/pacman.d/mirrorlist

# Install wget and zsh
sudo pacman -S --noconfirm wget zsh

# Change default user shell to zsh
sudo usermod -s /bin/zsh cesar

# Install Oh-My-Zsh and Customize configuration file
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

# Export personal config
cat << 'EOF' > /home/cesar/.zshrc
###################################
# 1. Exports
###################################

export PATH=~/.emacs.d/bin:$PATH
export XDG_CONFIG_HOME=~/.config
export ZSH=~/.oh-my-zsh
export REPO=~/Repositories
export CESAR_REPO=$REPO/cesarleonc
export ARCH_REPO=$CESAR_REPO/Arch
export UPDATE_ZSH_DAYS=13

###################################
# 2. Variables
###################################

ZSH_THEME="rkj-repos"
DISABLE_UPDATE_PROMPT="true"
plugins=(git github)
source $ZSH/oh-my-zsh.sh
EOF

mkdir -p ~/.config/xmonad
mkdir -p ~/.config/xmobar

# Install Window Manager and Display Manager
sudo pacman -S --noconfirm xorg

# Install without conflicts 
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter xmonad xmonad-contrib \
                xmobar dmenu picom nitrogen alacritty chromium

# Copiar el archivo de configuracion a la carpeta correspondiente
cp ~/Repositories/cesarleonc/Arch/configs/xmonad.hs ~/.config/xmonad/xmonad.hs
cp ~/Repositories/cesarleonc/Arch/configs/xmobarrc ~/.config/xmobar/xmobarrc
cp ~/Repositories/cesarleonc/Arch/configs/.xprofile ~/.xprofile

sudo systemctl enable lightdm
xmonad --recompile
sudo systemctl start lightdm
