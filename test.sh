#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: INSTALL XMONAD WINDOW MANAGER
#################################################

REPO="$HOME/Repositories/cesarleonc/Arch/"
CONFIG="$HOME/.config/"
MIRRORLIST="/etc/pacman.d/mirrorlist"

# Update XDG config directory, create XDG directories and copy files
xdg-user-dirs-update
mkdir -p $HOME/.local/share/xmonad \
         $HOME/.local/share/fonts \
         $HOME/opt

cp -r $REPO/dotfiles/.config/* $CONFIG
cp $REPO/dotfiles/.xprofile $HOME/

# Update Ecuadorian mirorlist
sudo rm $MIRRORLIST
sudo cp \
    $CONFIG/mirrors/Ecuador-mirrorlist \
    $MIRRORLIST

# Install wget and zsh
sudo pacman -S --noconfirm \
        alacritty neovim wget zsh \
        noto-fonts noto-fonts-emoji \
        ttf-dejavu \
        otf-latin-modern otf-latinmodern-math
        
sudo pacman -S --noconfirm \        
        fd emacs ripgrep \
        obs-studio vifm vlc virtualbox \

## AUR fonts
# git clone \
#     https://aur.archlinux.org/font-symbola.git \
#     $HOME/Repositories/font-symbola

# (cd $HOME/Repositories/font-symbola && \
#     makepkg -sic --noconfirm)

fc-cache -vf

# Change default user shell to zsh
sudo usermod -s /bin/zsh cesar

# Install Oh-My-Zsh and Customize configuration file
ZSH=$CONFIG/zsh/.oh-my-zsh sh -c \
    "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

# Copy dot files
cp $CONFIG/zsh/.zshenv $HOME/

# Install Window Manager and Display Manager
sudo pacman -S --noconfirm xorg

# Install without conflicts 
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter \
                xmonad xmonad-contrib \
                xmobar dmenu \
                picom nitrogen

# Enable and Start the greeter
sudo systemctl enable lightdm
xmonad --recompile
sudo systemctl start lightdm
