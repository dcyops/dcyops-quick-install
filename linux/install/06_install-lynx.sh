#!/usr/bin/env bash

[ "$(which lynx)" ] || {
  printf "[*] Installing 'lynx'...\n"
  sudo apt-get install -y --no-install-recommends --no-install-suggests lynx || 
	{ printf "\n[!] Error installing 'lynx' with apt. Exiting...\n"; exit 1; }
}

mkdir "${HOME}/.local/bin" 2>/dev/null

printf "\n[*] Creating symbolic links...\n"

ln -sfv "${HOME}/.Repos/github.com/dcyops/dcyops-quick-install/linux/config/lynx/bin/google" "${HOME}/.local/bin/google" ||
	{ printf "\n[!] Error creating symbolic link for 'google'. Exiting...\n"; exit 1; }

ln -sfv "${HOME}/.Repos/github.com/dcyops/dcyops-quick-install/linux/config/lynx/bin/duck" "${HOME}/.local/bin/duck" || 
	{ printf "\n[!] Error creating symbolic link for 'duck'. Exiting...\n"; exit 1; }

ln -sfv "${HOME}/.Repos/github.com/dcyops/dcyops-quick-install/linux/config/lynx/bin/lynx" "${HOME}/.local/bin/lynx" || 
	{ printf "\n[!] Error creating symbolic link for 'lynx'. Exiting...\n"; exit 1; }
