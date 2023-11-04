xmodmap -e "keysym Alt_L = Mode_switch" &
xmodmap -e "keycode 46 = l L Right L" &
xmodmap -e "keycode 45 = k K Up K" &
xmodmap -e "keycode 44 = j J Down J" &
xmodmap -e "keycode 43 = h H Left H" &

feh --bg-fill /home/y/Pictures/wallpapers/current.png &
/home/k/.dwm/autostart.sh &
/home/k/.dwm/bat.sh &
/home/k/.dwm/screen.sh &
pipewire &

exec dbus-run-session dwm 
