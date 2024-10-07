#!/bin/bash

#-----------------------------------
# Dependencies
#-----------------------------------

sudo pacman -Sy

# Base
sudo pacman -S curl wget jq nano qt6-multimedia-ffmpeg unzip

# Development
sudo pacman -S base-devel git python cargo nodejs npm

# Graphics Driver
sudo pacman -S nvidia nvidia-utils nvidia-prime egl-wayland

# Environment Utilities
sudo pacman -S greetd greetd-regreet pamixer playerctl brightnessctl libnotify polkit xdg-desktop-portal-wlr xdg-desktop-portal-gtk nwg-bar networkmanager alsa-utils bluez-utils blueman

# Hyprland
sudo pacman -S hyprland hyprpicker waybar rofi swww swaylock

# Hyprland Utilities
sudo pacman -S alacritty dolphin wl-clipboard dunst btop network-manager-applet bluez

# Fonts
sudo pacman -S ttf-firacode-nerd ttf-font-awesome

# NeoVim + LazyVim
sudo pacman -S neovim
sudo pacman -S fish fd lua luarocks lazygit tree-sitter

sudo npm install -S neovim

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Applications (Terminal)
sudo pacman -S btop nvtop cmatrix fastfetch

# Applications (GUI)
sudo pacman -S chromium code inkscape blender freecad

#-----------------------------------
# Gimp + Phptoshop Theme
#-----------------------------------
sudo pacman -S gimp
sh -c "$(curl -fsSL https://raw.githubusercontent.com/doctormo/GimpPs/master/tools/install.sh)"

#-----------------------------------
# Oh-my-posh
#-----------------------------------
curl -s https://ohmyposh.dev/install.sh | bash -s

[EDIT] ~/.bashrc
PATH=${HOME}/.local/bin:${PATH}
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/config.omp.json)"

#-----------------------------------
# Nvidia DRM kernel mode setting
#-----------------------------------
[EDIT] /etc/mkinitcpio.conf
MODULES=(... nvidia nvidia_modeset nvidia_uvm nvidia_drm)

[CREATE] /etc/modprobe.d/nvidia.conf
options nvidia_drm modeset=1 fbdev=1

sudo mkinitcpio -P
sudo reboot
#-----------------------------------
# Boot quiet
#-----------------------------------
[EDIT] /boot/loader/entries/*linux.conf
options root=... quiet loglevel=3 rd.systemd.show_status=auto rd.udev.log_priority=3

#-----------------------------------
# Enable services
#-----------------------------------
sudo systemctl enable greetd
sudo systemctl start greetd

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

sudo systemctl enable bluetooth
sudo systemctl start bluetooth
#-----------------------------------

#-----------------------------------
# Move Files
#-----------------------------------
mv -f home/.config ~/
sudo cp -R etc/greetd /etc/