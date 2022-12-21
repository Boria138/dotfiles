#!/bin/bash


sudo pacman -S --needed xorg xorg-xserver xorg-xinit ttf-ubuntu-font-family sddm plasma firefox kde-applications
sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot
