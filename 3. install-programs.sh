#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: INSTALL VARIETY OF PROGRAMS
#################################################

# Install emacs
sudo pacman -S --noconfirm fd emacs ripgrep

# Install doom emacs
git clone https://github.com/hlissner/doom-emacs /home/cesar/.emacs.d
/home/cesar/.emacs.d/bin/doom install

# Install accesories
sudo pacman -S --noconfirm zsh wget gimp obs-studio \
          vifm audacity kdenlive vlc virtualbox
# Change default user shell to zsh
sudo usermod -s /bin/zsh cesar
