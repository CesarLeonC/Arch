#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: INSTALL XMONAD WINDOW MANAGER
#################################################

# Update XDG config directory
xdg-user-dirs-update

# Update Ecuadorian mirorlist
sudo rm /etc/pacman.d/mirrorlist
sudo cp ~/Repositories/cesarleonc/Arch/dotfiles/.config/mirrors/Ecuador-mirrorlist /etc/pacman.d/mirrorlist

# Install wget and zsh
sudo pacman -S --noconfirm wget zsh nvim

# Change default user shell to zsh
sudo usermod -s /bin/zsh cesar

# Install Oh-My-Zsh and Customize configuration file
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

# Copy dot files
cp ~/Repositories/cesarleonc/Arch/dotfiles/.config/zsh/.zshenv ~/.zshenv
cp ~/Repositories/cesarleonc/Arch/dotfiles/.config/* ~/.config/
cp ~/.config/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

# Install Window Manager and Display Manager
sudo pacman -S --noconfirm xorg

# Install without conflicts 
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter xmonad xmonad-contrib \
                xmobar dmenu picom nitrogen alacritty

# Enable and Start the greeter
sudo systemctl enable lightdm
xmonad --recompile
sudo systemctl start lightdm
