#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: SCRIPT READY TO FIX PROBLEMS 
#                  WITH MY PERSONAL PC
#################################################

# Export personal config
cat << 'EOF' > /home/cesar/.zshrc
###################################
# 1. Exports
###################################

export PATH=~/.emacs.d/bin:$PATH
export $XDG_CONFIG_HOME=~/.config/
export ZSH=~/.oh-my-zsh

export UPDATE_ZSH_DAYS=13

###################################
# 2. Variables
###################################

ZSH_THEME="rkj-repos"
DISABLE_UPDATE_PROMPT="true"
plugins=(git github)
source $ZSH/oh-my-zsh.sh
EOF

# Recompile and Restart XMonad
# (Mod+Shift+Q required to see changes)
xmonad --recompile
xmonad --restart
