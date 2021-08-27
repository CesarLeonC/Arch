#!/bin/bash

#################################################
#     Name: Cesar Leon C.
#     E-mail: leoncesaralejandro@gmail.com
#     Type: Shell Script
#     Date: August, the 7th/ 2021
#     Description: ARCH LINUX INSTALL USING
#                  PERSONAL CONFIG
#################################################

# Activar comando del tiempo
timedatectl set-ntp true
# Definir zona horaria
ln -sf /usr/share/zoneinfo/America/Guayaquil /etc/localtime
# Activar la zona horaria
hwclock --systohc
# Quitar marca de comentario de linea 177 "en_us.UTF-8 UTF-8"
sed -i '177s/.//' /etc/locale.gen
# Generar local
locale-gen
# Definir el lenguaje predeterminado
echo "LANG=en_us.UTF-8" >> /etc/locale.conf
# Definir el nombre de la maquina
echo "master" >> /etc/hostname
# Crear los ip locales
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 master.localdomain master" >> /etc/hosts

pacman -S --noconfirm pacutils base-devel dnsutils

# Cambiar el pass de root
echo root:cesar.leon.14 | chpasswd

# Instalar todo
pacinstall --yolo grub networkmanager network-manager-applet dialog wpa_supplicant \
                  mtools dosfstools reflector linux-headers avahi \
                  xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils \
                  bluez bluez-utils cups hplip alsa-utils pulseaudio bash-completion \
                  openssh rsync acpi acpi_call tlp virt-manager dnsmasq \
                  qemu qemu-arch-extra edk2-ovmf bridge-utils vde2 openbsd-netcat \
                  iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid \
                  os-prober ntfs-3g terminus-font os-prober broadcom-wl zsh neovim

# Instalar grub dentro de BIOS/MBR
grub-install --target=i386-pc /dev/sda
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
cp ./arch/dotfiles/.config/zsh/.zshenv /home/cesar/

echo "cesar ALL=(ALL) ALL" >> /etc/sudoers.d/cesar

echo "Listo, proceso finalizado!"
