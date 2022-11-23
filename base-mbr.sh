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
echo root:password | chpasswd
sed -i '33s/.//' /etc/pacman.conf
sed -i '38s/.//' /etc/pacman.conf
sed -i '94s/.//' /etc/pacman.conf
sed -i '95s/.//' /etc/pacman.conf
echo "ILoveCandy" >> /etc/pacman.conf


pacman -S grub networkmanager bluez bluez-utils bash-completion openssh reflector os-prober ntfs-3g pulseaudio pulseaudio-alsa pulseaudio-jack xdg-user-dirs xdg-utils

grub-install /dev/sda
sed -i '63s/.//' /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth

useradd -mG wheel,realtime,storage -s /bin/bash barry
echo barry:password | chpasswd

if ! builtin type -p 'yay' >/dev/null 2>&1; then
  CWD=`pwd`
  echo 'Install yay.'
  tmpdir="$(command mktemp -d)"
  command cd "${tmpdir}" || return 1
  sudo pacman -Sy --needed --noconfirm base base-devel git
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -sric
  cd $CWD
fi

LC_ALL=C xdg-user-dirs-update --force

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




