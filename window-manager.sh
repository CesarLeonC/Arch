# Install Window Manager and Display Manager
sudo pacman -S xorg

# Install without conflicts 
pacinstall --yolo lightdm lightdm-gtk-greeter xmonad xmonad-contrib xmobar \
                dmenu picom nitrogen

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
   modMask    = myModMask
   terminal   = myTerminal
   }
EOF

xmonad --recompile
xmonad --restart
