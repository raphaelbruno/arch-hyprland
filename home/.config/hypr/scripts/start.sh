#!/usr/bin/env bash

swww init &

sleep 1
sh ~/.config/hypr/scripts/lock-screen
swayidle -w timeout 300 "~/.config/hypr/scripts/lock-screen" &

dunst &
systemctl --user start plasma-polkit-agent &

waybar &

sleep 1
nm-applet --indicator &
blueman-applet &