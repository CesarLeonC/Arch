# Install Window Manager and Display Manager
sudo pacman -Syy 

# Install without conflicts 
pacinstall --no-confirm --resolve-conflicts="all" xorg lightdm lightdm-gtk-greeter \
  xmonad xmonad-contrib xmobar dmenu picom nitrogen

# Only on VM
sed -i "216s/.//" /etc/xdg/picom.conf
sed -i "216s/.//" /etc/xdg/picom.conf
sed -e "217s/^/#/g" /etc/xdg/picom.conf
