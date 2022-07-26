#!/bin/sh

nitrogen --restore & 
picom -b & 
nm-applet &
gnome-keyring & 
polkit-dumb-agent &
optimus-manager-qt &
pcmanfm -d &
battery-notifier.sh & 
gpg-connect-agent /bye &
