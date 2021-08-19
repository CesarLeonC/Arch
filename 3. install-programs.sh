#!/bin/zsh

#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: INSTALL VARIETY OF PROGRAMS
#################################################

# Actualizar los mirrors
sudo rm -rf $PACMAN_D_DIR/mirrorlist
cp $XDG_CONFIG_HOME/mirrors/World-mirrorlist $PACMAN_D_DIR/mirrorlist

# Install emacs
sudo pacman -S --noconfirm fd emacs ripgrep

# Install doom emacs
git clone https://github.com/hlissner/doom-emacs $XDG_CONFIG_HOME/emacs.d
$XDG_CONFIG_HOME/emacs.d/bin/doom install

# Install accesories
sudo pacman -S --noconfirm obs-studio vifm vlc virtualbox

# Return to Ecuadorian mirrorlist
sudo rm -rf $PACMAN_D_DIR/mirrorlist
cp $XDG_CONFIG_HOME/mirrors/Ecuador-mirrorlist $PACMAN_D_DIR/mirrorlist
