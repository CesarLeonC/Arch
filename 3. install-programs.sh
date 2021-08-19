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
sudo cp $XDG_CONFIG_HOME/mirrors/World-mirrorlist $PACMAN_D_DIR/mirrorlist

# Install emacs
sudo pacman -S --noconfirm fd emacs ripgrep

# Install doom emacs
git clone https://github.com/hlissner/doom-emacs $XDG_CONFIG_HOME/emacs.d

# So we don't have to write $XDG_CONFIG_HOME/emacs.d/bin/doom every time
PATH="$XDG_CONFIG_HOME/emacs.d/bin:$PATH"

# Create a directory for our private config
mkdir $XDG_CONFIG_HOME/doom  # or ~/.config/doom

# The init.example.el file contains an example doom! call, which tells Doom what
# modules to load and in what order.
cp $XDG_CONFIG_HOME/emacs.d/init.example.el $XDG_CONFIG_HOME/doom/init.el
cp $XDG_CONFIG_HOME/emacs.d/core/templates/config.example.el $XDG_CONFIG_HOME/doom/config.el
cp $XDG_CONFIG_HOME/emacs.d/core/templates/packages.example.el $XDG_CONFIG_HOME/doom/packages.el

# Then synchronize Doom with your config:
doom sync
doom env

# Lastly, install the icon fonts Doom uses:
emacs --batch -f all-the-icons-install-fonts
$XDG_CONFIG_HOME/emacs.d/bin/doom install

# Install accesories
sudo pacman -S --noconfirm obs-studio vifm vlc virtualbox

# Return to Ecuadorian mirrorlist
sudo rm -rf $PACMAN_D_DIR/mirrorlist
sudo cp $XDG_CONFIG_HOME/mirrors/Ecuador-mirrorlist $PACMAN_D_DIR/mirrorlist