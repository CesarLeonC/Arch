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

# Update XDG config directory, create XDG directories and copy files
xdg-user-dirs-update
mkdir -p $HOME/.local/share/xmonad
mkdir -p $HOME/opt
mkdir -p $HOME/.cache

cp -r $REPO/dotfiles/.config/* $CONFIG
cp $REPO/dotfiles/.xprofile $HOME/

# Update Ecuadorian mirorlist
sudo rm /etc/pacman.d/mirrorlist
sudo cp $CONFIG/mirrors/Ecuador-mirrorlist /etc/pacman.d/mirrorlist

# Install wget and zsh
sudo pacman -S --noconfirm wget zsh neovim \
        noto-fonts noto-fonts-emoji \
        ttf-dejavu \
        otf-latin-modern otf-latinmodern-math

## AUR fonts
git clone \
    https://aur.archlinux.org/font-symbola.git \
    $HOME/Repositories/font-symbola

(cd $HOME/Repositories/font-symbola && \
    makepkg -sic --noconfirm)

fc-cache -vf

# Change default user shell to zsh
sudo usermod -s /bin/zsh cesar

# Install Oh-My-Zsh and Customize configuration file
ZSH=$CONFIG/zsh/.oh-my-zsh sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

# Copy dot files
cp $CONFIG/zsh/.zshenv ~/

# Install Window Manager and Display Manager
sudo pacman -S --noconfirm xorg

# Install without conflicts 
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter xmonad xmonad-contrib \
                xmobar dmenu picom nitrogen alacritty

# Enable and Start the greeter
sudo systemctl enable lightdm
xmonad --recompile
sudo systemctl start lightdm
