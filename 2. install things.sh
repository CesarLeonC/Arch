pacman -S --noconfirm pacutils base-devel dnsutils

# Cambiar el pass de root
echo root:cesar.leon.14 | chpasswd

# Instalar todo
pacinstall --yolo grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant \
                  mtools dosfstools reflector linux-headers avahi \
                  xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils \
                  bluez bluez-utils cups hplip alsa-utils pulseaudio bash-completion \
                  openssh rsync acpi acpi_call tlp virt-manager dnsmasq \
                  qemu qemu-arch-extra edk2-ovmf bridge-utils vde2 openbsd-netcat \
                  iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid \
                  os-prober ntfs-3g terminus-font os-prober broadcom-wl-dkms

# Instalar grub dentro de BIOS/MBR
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
# Habilitar el os-prober para encontrar Windows
echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# Habilitar servicios basicos
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

# Crear usuario local
useradd -mG wheel cesar
echo cesar:cesar.leon.14 | chpasswd
usermod -aG libvirt cesar
usermod -s /bin/zsh cesar

echo "cesar ALL=(ALL) ALL" >> /etc/sudoers.d/cesar

echo "Listo, proceso finalizado!"
