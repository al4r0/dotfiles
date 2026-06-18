#!/bin/sh
set -e

echo "==> Instalando dependencias..."
apt-get update -qq
apt-get install -y \
    xorg bspwm sxhkd kitty \
    polybar rofi dmenu \
    pulseaudio alsa-utils pavucontrol \
    xcursor-themes dmz-cursor-theme \
    x11-xserver-utils xterm \
    git

echo "==> Copiando configuraciones..."
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config/bspwm ~/.config/sxhkd ~/.config/polybar \
         ~/.config/kitty ~/.config/rofi

cp "$DOTFILES/.config/bspwm/bspwmrc"     ~/.config/bspwm/
cp "$DOTFILES/.config/sxhkd/sxhkdrc"     ~/.config/sxhkd/
cp "$DOTFILES/.config/polybar/config.ini" ~/.config/polybar/
cp "$DOTFILES/.config/polybar/launch.sh"  ~/.config/polybar/
cp "$DOTFILES/.config/kitty/kitty.conf"   ~/.config/kitty/
cp "$DOTFILES/.config/rofi/config.rasi"   ~/.config/rofi/
cp "$DOTFILES/.Xresources"                ~/
cp "$DOTFILES/.xinitrc"                   ~/

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh

echo "==> Instalando scripts del sistema..."
cp "$DOTFILES/bin/vol-up" /usr/local/bin/vol-up
chmod +x /usr/local/bin/vol-up

echo ""
echo "Listo. Ejecuta: startx"
