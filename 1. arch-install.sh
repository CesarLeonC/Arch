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
echo "archlinux" >> /etc/hostname
# Crear los ip locales
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 cesarleonc.localdomain archlinux" >> /etc/hosts
