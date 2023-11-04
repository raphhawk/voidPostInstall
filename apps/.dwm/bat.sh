#!/bin/sh

# dependency: libnotify, notification-daemon
#
# config: /usr/share/dbus-1/services
#
# [D-BUS Service]
# Name=org.freedesktop.Notifications
# Exec=/usr/lib/notification-daemon-1.0/notification-daemon
#
# Control variable
# Possible values: NONE, FULL, LOW, CRITICAL
last="NONE"

# Default values for LOW/CRITICAL status
low=20
critical=15

while true; do
  # If battery is plugged, do stuff
  battery="/sys/class/power_supply/BAT0"
  if [ -d $battery ]; then
    capacity=$(cat $battery/capacity)
    status=$(cat $battery/status)

    if [ "$last" != "NONE" ] && [ "$status" = "Charging" ];then
      notify-send "Battery Charging"
      last="NONE"
    fi

    # If battery full and not already warned about that
    if [ "$last" != "FULL" ] && [ "$status" = "Full" ]; then
      notify-send "Battery full"
      last="FULL"
    fi

    # If low and discharging
    if [ "$last" != "LOW" ] && [ "$status" = "Discharging" ] && \
       [ $capacity -le $low ]; then
      notify-send "Battery low: $capacity%"
      last=LOW
    fi

    # If critical and discharging
    if [ "$status" = "Discharging" ] && [ $capacity -le $critical ]; then
      notify-send -u critical "Battery very low: $capacity%"
      last=CRITICAL
    fi
  fi
  sleep 60
done
