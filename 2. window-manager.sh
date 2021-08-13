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
echo "alias CESAR_REPO=~/Repositories/cesarleonc" >> ~/.bashrc
# Install Window Manager and Display Manager
sudo pacman -S --noconfirm xorg

# Install without conflicts 
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter xmonad xmonad-contrib \
                xmobar dmenu picom nitrogen alacritty chromium

# Copiar el archivo de configuracion a la carpeta correspondiente
cp $CESAR_REPO/Arch/configs/xmonad.hs $XDG_CONFIG_HOME/xmonad/xmonad.hs
cp $CESAR_REPO/Arch/configs/xmobarrc $XDG_CONFIG_HOME/xmobar/xmobarrc

sudo systemctl enable lightdm
xmonad --recompile
sudo systemctl start lightdm
