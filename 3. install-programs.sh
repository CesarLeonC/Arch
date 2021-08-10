#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: SCRIPT READY TO FIX PROBLEMS 
#                  WITH MY PERSONAL PC
#################################################

# Install emacs
pacman -S --noconfirm fd emacs ripgrep

# Install doom emacs
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# Check installation
doom doctor

# Install accesories
pacman -S --noconfirm zsh wget
