#!/bin/sh

nitrogen --restore --set-scaled ~/Pictures/wallpapers/ & 
picom -b & 
nm-applet &
gnome-keyring & 
polkit-dumb-agent &
optimus-manager-qt &
pcmanfm -d &
battery-notifier &
volumeicon &
gpg-connect-agent /bye &
xclip -silent &
imwheel &
