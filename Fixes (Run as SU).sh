#################################################
#     Name: Cesar Leon C.
#     Type: Shell Script
#     Date: August, the 8th/ 2021
#     Description: SCRIPT READY TO FIX PROBLEMS 
#                  WITH MY PERSONAL PC
#################################################

# Run these scripts only as a Super User
# Include tap-to-click method on touchpads

sudo cat << EOF > /etc/X11/xorg.conf.d/30-touchpad.conf
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
EndSection
EOF
