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


	echo 'Configure neovim plugins and updates'
  nvim --headless +PackerSync +qall

yay --noconfirm -S xorg xorg-xinit xorg-server rofi feh xdg-utils xdg-user-dirs i3-gaps autotiling-git xss-lock neovim networkmanager pulseaudio pavucontrol lxsession dunst git pcmanfm-gtk3 gvfs npm nodejs python-pip pluma xsel pamixer kitty qt5-tools lxappearance breeze breeze-gtk papirus-icon-theme archlinux-wallpaper htop ranger neofetch scrot polybar ttf-jetbrains-mono gsimplecal picom-git nerd-fonts-jetbrains-mono zoom betterlockscreen noisetorch-bin lrzip unrar unzip unace p7zip squashfs-tools file-roller mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

echo 'Configuring dotfiles'

git clone https://github.com/boria138/dotfiles.git $HOME/.dotfiles
sudo cp -f dotfiles/setings/i915.conf /etc/modprobe.d/
sudo cp -f .dotfiles/setings/100-touchpad.conf /etc/X11/xorg.conf.d/
cp -r -f .dotfiles/.config ~/
sudo ln -s $HOME/.config/nvim /root/.config/nvim
LC_ALL=C xdg-user-dirs-update --force
betterlockscreen -u /usr/share/backgrounds/archlinux/landscape.jpg


echo
echo 'Cleaning up unwanted packages'
yay -Qtdq | yay -Rns --noconfirm - 2>/dev/null
echo

echo
echo '##################################################'
echo '##                                              ##'
echo '##           Installation Complete!             ##'
echo '## PLEASE REBOOT TO USE THE NEW CONFIGURATIONS! ##'
echo '##                                              ##'
echo '##################################################'
echo


