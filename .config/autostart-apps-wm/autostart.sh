#!/bin/sh

nitrogen --restore --set-scaled ~/Pictures/wallpapers/ & 
picom -b & 
nm-applet &
gnome-keyring & 
polkit-dumb-agent &
optimus-manager-qt &
pcmanfm -d &
battery-notifier & 
gpg-connect-agent /bye &
