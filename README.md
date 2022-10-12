**WM:**

```
xorg xorg-xinit xorg-server rofi feh xdg-utuls xdg-user-dirs i3-gaps autotiling xss-lock
```

**SYSTEM SOFT:**

```
neovim networkmanager pulseaudio pavucontrol lxsession dunst git pcmanfm-gtk3 gvfs npm nodejs python-pip pluma xsel pamixer kitty qt5-tools
```

**TERMINAL SOFT:**

```
htop ranger neofetch scrot
```

**ENVIROMENT VARIABLES AND SYMLINKS:**

```
sudo ln -s $HOME/.config/nvim /root/.config/nvim
LC_ALL=C xdg-user-dirs-update --force
export PATH="${PATH}:$HOME/.local/bin"
```

**THEMES:**

```
lxappearance breeze breeze-gtk papirus-icon-theme archlinux-wallpaper
```

**Polybar**

```
polybar ttf-jetbrains-mono gsimplecal
```

**AUR**

```
git clone https://aur.archlinux.org/yay-bin.git
yay -S picom-git nerd-fonts-jetbrains-mono zoom ly betterlockscreen noisetorch-bin ttf-ms-fonts
```

**Config Files**

```
/etc/X11/xorg.conf.d/100-touchpad.conf
/etc/X11/xorg.conf.d/20-modesetings.conf
/etc/X11/xorg.conf.d/modesettings.conf
/etc/modprobe.d/i915.conf
```
