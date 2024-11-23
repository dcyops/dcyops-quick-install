#!/usr/bin/env bash

set -e
trap 'printf "Error on line $LINENO: $BASH_COMMAND returned $?"' ERR

CONFIG_PATH="$(dirname "$(readlink -f "$0")")"
readonly CONFIG_PATH

command -v python3 >/dev/null || \
  sudo apt-get install -y python3 --no-install-recommends --no-install-suggests

dpkg -l | grep -q python3-dbus || \
  sudo apt-get install -y python3-dbus --no-install-recommends --no-install-suggests

command -v spotify >/dev/null || \
  { printf "\n[!] Unable to find Spotify, is it installed? Exiting...\n"; exit 1; }

chmod +x "${CONFIG_PATH}/spotify-url-handler.py"

mkdir -p "${HOME}/.local/share/applications" "${HOME}/.local/bin"

ln -sfv "${CONFIG_PATH}/spotify-url.desktop" "${HOME}/.local/share/applications/spotify-url.desktop"
ln -sfv "${CONFIG_PATH}/spotify-url-handler.py" "${HOME}/.local/bin/spotify-url-handler.py"

# Register spotify-url.desktop as the default handler for Spotify URIs
xdg-mime default spotify-url.desktop x-scheme-handler/spotify
