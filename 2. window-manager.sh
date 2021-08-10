#! /bin/bash

#################################################
#     Name: Cesar Leon C.
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: WINDOW MANAGER INSTALL
#################################################

# Install Window Manager and Display Manager
sudo pacman -S --noconfirm xorg

# Install without conflicts 
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter xmonad xmonad-contrib xmobar \
                dmenu picom nitrogen alacritty chromium

# Crear el directorio y el archivo con la configuracion
mkdir -p /home/cesar/.xmonad/
cat << EOF > /home/cesar/.xmonad/xmonad.hs
------------------------------------------
-- 1.- Imports
------------------------------------------

import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

myModMask     = mod4Mask
myTerminal    = "alacritty"
myBorderWidth = 2

main :: IO ()
main = xmonad $ def
   {
   modMask    = myModMask,
   terminal   = myTerminal
   }
EOF

sudo systemctl enable lightdm
xmonad --recompile
sudo systemctl start lightdm
