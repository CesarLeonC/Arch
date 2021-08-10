# Corregir tapeo con click de los pads para mouse
cat << EOF > /etc/X11/xorg.conf.d/30-touchpad.conf
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
EndSection
EOF

# Install new shell, customizations, emacs and others
sudo pacman -S zsh 
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
