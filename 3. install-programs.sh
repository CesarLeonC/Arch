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

# Check installation
doom &>> ~/doom_log.txt

# Install accesories
sudo pacman -S --noconfirm zsh wget gimp obs \
          vifm audacity kdenlive vlc virtualbox

# Export personal config
cat << EOF > /home/cesar/.zshrc
export PATH=/home/cesar/.emacs.d/bin:$PATH
export ZSH=/home/cesar/.oh-my-zsh
ZSH_THEME="rkj-repos"
DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=13
plugins=(git github)
source /home/cesar/.oh-my-zsh/oh-my-zsh.sh
EOF
