#!/bin/sh

# Load .Xresources
[[ -f ~/.Xresources ]] && xrdb -I$HOME ~/.Xresources

# Source .xprofile
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Load notification daemon
#dunst &

# Set wallpaper with feh
[[ -f ~/.fehbg ]] && sh ~/.fehbg

# Load window manager
exec i3
