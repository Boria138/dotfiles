#!/bin/bash

sudo pacman -S --needed xorg xorg-server xorg-xinit ttf-ubuntu-font-family sddm plasma firefox kde-applications pakagekit-qt5 hunspell-en_us hunspell-ru hunspell
sudo systemctl enable sddm
