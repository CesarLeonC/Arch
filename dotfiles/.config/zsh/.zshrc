#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Dot File
#     Date: August, the 18th/ 2021
#     Description: .zshrc file
#################################################

###################################
# 1. Exports
###################################
## General variables
export PACMAN_D_DIR="/etc/pacman.d"

## XMonad configuration variables
export XMONAD_CONFIG_DIR="$XDG_CONFIG_HOME/xmonad"
export XMONAD_DATA_DIR="$XMONAD_CONFIG_DIR/data"
export XMONAD_CACHE_DIR="$XMONAD_CONFIG_DIR/cache"

## Oh-My-Zsh configuration variables
export UPDATE_ZSH_DAYS=13

###################################
# 2. Variables
###################################

ZSH_THEME="rkj-repos"
DISABLE_UPDATE_PROMPT="true"
plugins=(git github)
source $ZSH/oh-my-zsh.sh
