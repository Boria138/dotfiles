**WM:**

```
xorg xorg-xinit xorg-server rofi feh betterlockscreen xdg-utuls xdg-user-dirs i3-gaps autotiling
```

**SYSTEM SOFT:**

```
neovim networkmanager pulseaudio pavucontrol lxsession dunst lydm pcmanfm gvfs npm nodejs python-pip pluma xsel pamixer kitty
```

**TERMINAL SOFT:**

```
htop ranger neofetch scrot
```

**ENVIROMENT VARIABLES AND SYMLINKS:**

```
sudo ln -s $HOME/.config/nvim /root/.config/nvim
export PATH="${PATH}:$HOME/.local/bin"
```

**THEMES:**

```
lxappearance breeze-gtk papirus-icon-theme
```

**Polybar**

```
sudo pacman -S polybar ttf-jetbrains-mono gsimplecal
yay -S nerd-fonts-jetbrains-mono
```

**Picom**

```
yay -S picom-git
```

**Config Files**

```
/etc/X11/xorg.conf.d/100-touchpad.conf
/etc/X11/xorg.conf.d/20-modesetings.conf
/etc/X11/xorg.conf.d/modesettings.conf
/etc/modprobe.d/i915.conf
```
