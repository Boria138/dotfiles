#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc



sudo pacman -S --noconfirm xorg sddm plasma-desktop plasma-nm powerdevil bluedevil firefox dolphin konsole
sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot