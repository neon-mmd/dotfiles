#!/bin/sh

waypaper --random --folder /usr/share/wallpapers/VVallpapers/ --fill stretch --backend swaybg --monitor All &
nm-applet &
gnome-keyring-daemon &
lxsession &
pcmanfm -d &
battery-notifier &
gpg-connect-agent /bye &
imwheel &
update-notifier &
waybar &
wl-paste --watch cliphist store &
