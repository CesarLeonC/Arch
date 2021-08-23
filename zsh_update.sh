#!/bin/bash
sudo pacman -Sy --noconfirm alacritty neovim pacman-mirrorlist zsh wget 
cp ~/Repositories/cesarleonc/arch/dotfiles/.config/zsh/.zshenv ~/
sudo usermod -s /bin/zsh cesar
echo "Shell cambiado correctamente"