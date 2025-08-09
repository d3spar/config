#!/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}
run picom
#run gwe --hide-window
run kdeconnect-cli

xset -dpms
xset s noblank
xset s off
