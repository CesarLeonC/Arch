#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Dot File
#     Date: August, the 18th/ 2021
#     Description: .zshenv file
#################################################

###################################
# 1. Exports
###################################
## General variables
export EDITOR="nvim"
export VISUAL="nvim"

## XDG related variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

## Zsh configuration variables
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH="$ZDOTDIR/.oh-my-zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

## Emacs related
export PATH=~/.emacs.d/bin:$PATH
