#!/usr/bin/env bash

swww init &

dunst &
systemctl --user start plasma-polkit-agent &

sleep 2
waybar &

sleep 2
nm-applet --indicator &
blueman-applet &
