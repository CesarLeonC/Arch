#!/bin/zsh

#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: INSTALL VARIETY OF PROGRAMS
#################################################

# Install fonts
## Oficial Fonts
sudo pacman -S \ 
#        --noconfirm \
        noto-fonts noto-fonts-emoji \
        ttf-dejavu \
        texlive-core texlive-fontsextra \
        otf-latin-modern otf-latinmodern-math
## AUR fonts
git clone \
    https://aur.archlinux.org/font-symbola.git \
    $HOME/Repositories/font-symbola

(cd $HOME/Repositories/font-symbola && \
    makepkg -sic --noconfirm)

fc-cache -vf

# Update mirrors
sudo rm -rf $PACMAN_D_DIR/mirrorlist
sudo cp $XDG_CONFIG_HOME/mirrors/World-mirrorlist $PACMAN_D_DIR/mirrorlist

# Install emacs
sudo pacman -S --noconfirm fd emacs ripgrep

# Install Doom Emacs
git clone https://github.com/hlissner/doom-emacs $HOME/.emacs.d

PATH="$HOME/.emacs.d/bin:$PATH"
EMACS_DIR="$HOME/.emacs.d"
DOOM_DIR="$HOME/.config/doom"

mkdir -p $DOOM_DIR
cp $EMACS_DIR/init.example.el $DOOM_DIR/init.el
cp $EMACS_DIR/core/templates/config.example.el $DOOM_DIR/config.el
cp $EMACS_DIR/core/templates/packages.example.el $DOOM_DIR/packages.el

doom sync
doom env
doom install

# Install accesories
sudo pacman -S --noconfirm obs-studio vifm vlc virtualbox

# Return to Ecuadorian mirrorlist
sudo rm -rf $PACMAN_D_DIR/mirrorlist
sudo cp $XDG_CONFIG_HOME/mirrors/Ecuador-mirrorlist $PACMAN_D_DIR/mirrorlist