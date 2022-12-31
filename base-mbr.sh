#!/bin/bash

read -p "
                    -> Введите имя учетной записи :  " username
clear
ln -sf /usr/share/zoneinfo/Asia/Almaty /etc/localtime
hwclock --systohc
sed -i s/'#en_US.UTF-8'/'en_US.UTF-8'/g /etc/locale.gen
sed -i s/'#ru_RU.UTF-8'/'ru_RU.UTF-8'/g /etc/locale.gen
locale-gen
echo "LANG=ru_RU.UTF-8" >> /etc/locale.conf
echo "KEYMAP=ru" >> /etc/vconsole.conf
echo "FONT=cyr-sun16" >> /etc/vconsole.conf
echo "ARCH" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 ARCH.localdomain ARCH" >> /etc/hosts
echo "Root Password"
passwd root
sed -i s/'#Color'/'Color'/g /etc/pacman.conf
sed -i s/'#ParallelDownloads = 5'/'ParallelDownloads = 5'/g /etc/pacman.conf
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sed -i s/'# %wheel ALL=(ALL:ALL) ALL'/'%wheel ALL=(ALL:ALL) ALL'/g /etc/sudoers

pacman -Syy --needed grub networkmanager bash-completion rsync reflector os-prober ntfs-3g pulseaudio pulseaudio-alsa pulseaudio-jack xdg-user-dirs xdg-utils realtime-privileges xorg xorg-server xorg-xinit dosfstools mtools archlinux-keyring

reflector --sort rate -l 10 --save /etc/pacman.d/mirrorlist
pacman -Syy

grub-install /dev/sda
sed -i s/'#GRUB_DISABLE_OS_PROBER=false'/'GRUB_DISABLE_OS_PROBER=false'/g /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

useradd -mG wheel,realtime,storage -s /bin/bash $username
echo "User Password"
passwd $username

printf "\e[1;32mDone!\e[0m"




