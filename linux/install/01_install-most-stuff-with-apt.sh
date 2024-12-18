#!/usr/bin/env bash

# Source the os-release file to get the ID variable
[ -z "${ID+x}" ] && source /etc/os-release

printf "\n[*] Installing required apt packages...\n\n"

if [ "${ID}" = "ubuntu" ] || [ "${ID}" = "debian" ] || [ "${ID_LIKE}" = "debian" ]; then
  sudo apt-get install -y --no-install-recommends --no-install-suggests gcc make g++ git lynx clang-format \
    fd-find bat apt-file python3 python3-virtualenv python3-venv \
    xsel shellcheck unzip cargo gcc-multilib rsyslog xclip pkg-config libssl-dev sound-icons || \
    { printf "\n[!] Error getting packages with apt. Exiting...\n"; exit 1; }

else
  sudo apt-get install -y --no-install-recommends --no-install-suggests gcc make g++ git lynx clang-format \
    fdfind batcat apt-file python3 python3-virtualenv python3-venv \
    xsel shellcheck unzip cargo gcc-multilib rsyslog xclip pkg-config libssl-dev sound-icons || \
    { printf "\n[!] Error getting packages with apt. Exiting...\n"; exit 1; }
fi

