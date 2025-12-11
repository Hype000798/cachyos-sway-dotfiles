#!/bin/bash
choice=$(printf "lock\nlogout\nreboot\nshutdown" | fuzzel --dmenu -p "Power Menu")
case $choice in
    lock) swaylock ;;
    logout) swaymsg exit ;;
    reboot) systemctl reboot ;;
    shutdown) systemctl shutdown ;;
esac
