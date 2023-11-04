#! /bin/zsh

picom -f &

while true; do 
  xsetroot -name " 📅 $(date "+%a %b %d ⏰ %H:%M") 🔋 $(cat /sys/class/power_supply/BAT0/capacity)% 🌐 $(iw dev|grep ssid|cut -d " " -f2) 💽 $(pulsemixer --get-volume|cut -d " " -f1)% 💡 $(brightnessctl|grep Current|cut -d "(" -f2|cut -d ")" -f1) "
  sleep 1m
done &

