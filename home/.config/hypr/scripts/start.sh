#!/usr/bin/env bash

swww init &
swww img ~/Pictures/Wallpapers/default.jpg


dunst &
systemctl --user start plasma-polkit-agent &

sleep 2
waybar &

sleep 2
nm-applet --indicator &
blueman-applet &
