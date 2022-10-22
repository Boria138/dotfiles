#!/bin/sh

echo '###############################'
echo '##                           ##'
echo '##    Install dependencies   ##'
echo '##                           ##'
echo '###############################'
echo

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

yay --noconfirm
cat ~/dotfiles/pkglist.txt | yay -Sy --noconfirm -

echo 'Configuring dotfiles'

sudo cp -f ~/dotfiles/setings/i915.conf /etc/modprobe.d/
sudo cp -f ~/dotfiles/setings/100-touchpad.conf /etc/X11/xorg.conf.d/
sudo cp -f ~/dotfiles/setings/modesetting.conf /etc/X11/xorg.conf.d/
sudo cp -f ~/dotfiles/setings/20-modesetting.conf /etc/X11/xorg.conf.d/
cp -r -f ~/dotfiles/.config ~/
sudo systemctl enable --now rngd
sudo systemctl enable --now dbus-broker.service
sudo systemctl --global enable dbus-broker.service
sudo systemctl mask systemd-fsck-root.service
LC_ALL=C xdg-user-dirs-update --force
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
