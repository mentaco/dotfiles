#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null)
metadata=$(playerctl metadata --format '{{ title }} / {{ artist }}' 2>/dev/null)

case "$status" in
Playing)
	icon="  "
	;;
Paused)
	icon="  "
	;;
*)
	exit 1
	;;
esac

printf '%s\n' "$icon $metadata"
