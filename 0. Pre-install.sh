# Definir cuando existe en disco
lsblk
# Crear las particiones correspondientes
cgdisk /dev/sdx

# Mapa de particiones
# |-----------+---------+---------+---------|
# | Particion +  Tamaño +  Mount  +         |
# |-----------+---------+---------+---------|
# | /dev/sdx1 +   300M  + /mnt/boot/efi     |
# | /dev/sdx2 + Restante+ /mnt              |

# Convertir las particiones a sus respectivos fs
mkfs.fat -FAT32 /dev/sdx1
mkfs.ext4 /dev/sdx2

# Montar las particiones a los respectivos lugares
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

# Revisar que las particiones esten asignadas
lsblk

# Instalar los paquetes basicos
pacstrap /mnt base linux-zen linux-zen-headers base-devel git neovim alacritty
