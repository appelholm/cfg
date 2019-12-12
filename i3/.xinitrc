#!/bin/sh

# Load .Xresources
[[ -f ~/.Xresources ]] && xrdb -I$HOME ~/.Xresources

# Load notification daemon
dunst &

# Set wallpaper with feh
[[ -f ~/.fehbg ]] && sh ~/.fehbg

# Load window manager
exec i3
