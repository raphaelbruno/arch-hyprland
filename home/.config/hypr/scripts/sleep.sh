swayidle -w timeout 300 "swaylock -i $(swww query | grep eDP-1 | awk -F'image: ' '{print $2}')" \
            timeout 600 "systemctl suspend" \
            before-sleep "swaylock -i $(swww query | grep eDP-1 | awk -F'image: ' '{print $2}')" &