#!/bin/bash
#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 7th/ 2021
#     Description: ARCH LINUX INSTALL USING
#                  PERSONAL CONFIG
#################################################
REPO="$HOME/Repositories/cesarleonc/arch/"
# 1. Instalar nuevo shell y accesorios
sudo pacman -Sy --noconfirm alacritty neovim \
                            pacman-mirrorlist \
                            zsh wget 
# 2. Copiar la configuracion
cp $REPO/dotfiles/.config/zsh/.zshenv $HOME/
# 3. Cambiar el shell predeterminado
sudo usermod -s /bin/zsh cesar
echo "Shell cambiado correctamente"
exit