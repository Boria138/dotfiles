#!/bin/sh

echo '###############################'
echo '##                           ##'
echo '##    Install dependencies   ##'
echo '##                           ##'
echo '###############################'
echo

yay --noconfirm
cat pkglist.txt | yay -Sy --noconfirm -

echo 'Configuring dotfiles'


cp -r -f .config ~/
sudo systemctl enable --now rngd
sudo systemctl enable --now dbus-broker.service
sudo systemctl --global enable dbus-broker.service
betterlockscreen -u /usr/share/backgrounds/archlinux/landscape.jpg
nvim --headless +PackerSync +qall

echo
echo 'Cleaning up unwanted packages'
yay -Yc --noconfirm
echo

echo
echo '##################################################'
echo '##                                              ##'
echo '##           Installation Complete!             ##'
echo '## PLEASE REBOOT TO USE THE NEW CONFIGURATIONS! ##'
echo '##                                              ##'
echo '##################################################'
echo

printf "Would you like to reboot? (y/N)"
read -r reboot
[ "$(tr '[:upper:]' '[:lower:]' <<< "$reboot")" = "y" ] && reboot
