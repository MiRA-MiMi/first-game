#!/bin/sh
printf '\033c\033]0;%s\a' FirstGame
base_path="$(dirname "$(realpath "$0")")"
"$base_path/FirstGame.x86_64" "$@"
