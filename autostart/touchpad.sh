#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.toggle_touchpad
id=$(xinput list --id-only 'ELAN1200:00 04F3:3090 Touchpad')
if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    xinput disable $id
    notify-send -u low -i mouse --icon=/usr/share/icons/HighContrast/256x256/status/touchpad-disabled.png "Trackpad disabled"
else
    rm $TOGGLE
    xinput enable $id
    notify-send -u low -i mouse --icon=/usr/share/icons/HighContrast/256x256/devices/input-touchpad.png "Trackpad enabled"
fi
