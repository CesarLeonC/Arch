#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: INSTALL XMONAD WINDOW MANAGER
#################################################

# 0. Definir las variables de interes
REPO="$HOME/Repositories/cesarleonc/arch/"
CONFIG="$HOME/.config/"
SHARE="$CONFIG/share"
MIRRORLIST="/etc/pacman.d/mirrorlist"

# 1. Crear carpetas de almacenamiento
# 1.1 Crear carpeta .config
xdg-user-dirs-update
echo "Carpeta '.config' creada correctamente!!"
sleep 3

mkdir -p \
    $SHARE/xmonad $SHARE/fonts \
    $HOME/opt $HOME/.cache
echo "Carpetas de configuracion creadas!!"
cp -r $REPO/dotfiles/.config/* $CONFIG
echo "Archivos .dot copiados!!"
echo "Esperando actualizacion total"
sleep 3

# 2. Actualizar sistema
# 2.1 Actualizar mirrors
sudo rm $MIRRORLIST && \
     sudo cp $CONFIG/mirrors/Ecuador-mirrorlist $MIRRORLIST
# 2.2 Actualizar base de datos
sudo pacman -Sy --noconfirm pacman-mirrorlist

# 3. Instalar Window Manager
# 3.1 Instalar los programas
sudo pacman -S --noconfirm xorg lightdm lightdm-gtk-greeter \
                xmonad xmonad-contrib \
                xmobar dmenu \
                picom nitrogen \
                alacritty neovim wget zsh
# 3.2 Establecer zsh como shell de preferencia
sudo usermod -s /bin/zsh cesar
echo "Shell cambiado correctamente"
sleep 3
# 3.3 Copiar configuraciones personales 
cp $REPO/dotfiles/.xprofile $HOME
cp $CONFIG/zsh/.zshenv $HOME
# 3.4 Iniciar sesion
sudo systemctl enable lightdm
xmonad --recompile