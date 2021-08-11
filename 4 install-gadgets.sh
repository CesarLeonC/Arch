#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: SCRIPT READY TO FIX PROBLEMS 
#                  WITH MY PERSONAL PC
#################################################

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

# Changing default shell
sudo usermod -s /bin/zsh cesar
xmonad --recompile
xmonad --restart
