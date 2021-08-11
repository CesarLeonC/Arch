#!/bin/bash

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
import XMonad.Layout.Grid
import Xmonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog

myModMask     = mod4Mask
myTerminal    = "alacritty"
myBorderWidth = 2
myLayoutHook  = grid ||| tiled ||| Mirror tiled ||| Full
   where
      grid    = Grid
      tiled   = Tall nmaster delta ratio
      nmaster = 1
      ratio   = 1/2
      delta   = 3/100

myConfig      = def
   {
   modMask        = myModMask,
   terminal       = myTerminal,
   layoutHooks    = myLayoutHooks
   }

main :: IO ()
main = xmonad . ewmh =<< xmobar myConfig
EOF

sudo systemctl enable lightdm
xmonad --recompile
sudo systemctl start lightdm
