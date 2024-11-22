#!/usr/bin/env bash

_PKGS=(
    pulseaudio
    pulseaudio-utils
    libasound2t64
    libasound2-plugins
    alsa-utils
    alsa-oss
    alsa-ucm-conf
)

if dpkg -l | grep -q 'ubuntu-server'; then

    for pkg in "${_PKGS[@]}"; do
        sudo apt-get install --no-install-recommends --no-install-suggests -y "${pkg}" || \
        printf "Unable to find '%s'" "${pkg}\n"
    done

    systemctl --user enable pulseaudio.service || \
    { printf "\n[!] Error enabling 'pulseaudio.service'. Exiting...\n"; exit 1; }

    systemctl --user start pulseaudio.service || \
    { printf "\n[!] Error starting 'pulseaudio.service'. Exiting...\n"; exit 1; }

    printf "Testing audio...\n"
    aplay /usr/share/sounds/alsa/Front_Center.wav || \
    { printf "\n[!] Error with sound check, investigate further... Exiting...\n"; exit 1; }
fi

unset _PKGS
