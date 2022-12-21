#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Almaty /etc/localtime
hwclock --systohc
sed -i '171s/.//' /etc/locale.gen
sed -i '398s/.//' /etc/locale.gen
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
sed -i '33s/.//' /etc/pacman.conf
sed -i '38s/.//' /etc/pacman.conf
sed -i '93s/.//' /etc/pacman.conf
sed -i '94s/.//' /etc/pacman.conf



pacman -S --nedded grub efibootmgr networkmanager bash-completion rsync reflector os-prober ntfs-3g pulseaudio pulseaudio-alsa pulseaudio-jack xdg-user-dirs xdg-utils realtime-privileges xorg xorg-server xorg-xinit dosfstools mtools

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable
sed -i '63s/.//' /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

useradd -mG wheel,realtime,storage -s /bin/bash barry
echo "User Password"
passwd barry
LC_ALL=C xdg-user-dirs-update --force


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




