#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: INSTALL XMONAD WINDOW MANAGER
#################################################

# Update XDG config directory, create XDG directories and copy files
xdg-user-dirs-update
mkdir -p $HOME/.local/share
mkdir -p $HOME/opt
mkdir -p $HOME/.cache

cp -r ~/Repositories/cesarleonc/Arch/dotfiles/.config/* ~/.config/

# Update Ecuadorian mirorlist
sudo rm /etc/pacman.d/mirrorlist
sudo cp ~/.config/mirrors/Ecuador-mirrorlist /etc/pacman.d/mirrorlist

# Install wget and zsh
sudo pacman -S --noconfirm wget zsh neovim

# Change default user shell to zsh
sudo usermod -s /bin/zsh cesar

# Install Oh-My-Zsh and Customize configuration file
ZSH=~/.config/zsh/.oh-my-zsh sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

# Copy dot files
cp ~/.config/zsh/.zshenv ~/

# Install Window Manager and Display Manager
sudo pacman -S --noconfirm xorg

# Install without conflicts 
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter xmonad xmonad-contrib \
                xmobar dmenu picom nitrogen alacritty

# Enable and Start the greeter
sudo systemctl enable lightdm
xmonad --recompile
sudo systemctl start lightdm
