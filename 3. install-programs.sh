#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: SCRIPT READY TO FIX PROBLEMS 
#                  WITH MY PERSONAL PC
#################################################

# Install emacs
sudo pacman -S --noconfirm fd emacs ripgrep

# Install doom emacs
git clone https://github.com/hlissner/doom-emacs /home/cesar/.emacs.d
/home/cesar/.emacs.d/bin/doom install

# Check installation
doom doctor

# Install accesories
sudo pacman -S --noconfirm zsh wget
