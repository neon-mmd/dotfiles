#!/bin/sh

nitrogen --restore --set-scaled ~/Pictures/wallpapers/ &
picom -b &
nm-applet &
gnome-keyring-daemon &
polkit-dumb-agent &
optimus-manager-qt &
pcmanfm -d &
battery-notifier &
gpg-connect-agent /bye &
xclip -quiet &
imwheel &
update-notifier &
volumeicon &
