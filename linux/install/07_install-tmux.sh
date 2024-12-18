#!/usr/bin/env bash

[ "$(which tmux)" ] || {
  printf "[*] Installing tmux...\n"
  sudo apt-get install -y --no-install-recommends --no-install-suggests tmux || 
  	{ printf "[!] Error installing tmux. Exiting....\n"; exit 1; }
}

rm -rf "${HOME}/.tmux" 2>/dev/null
rm -rf "${HOME}/.tmux.conf" 2>/dev/null

mkdir -p "${HOME}/.tmux/plugins"

ln -sfv "${HOME}/.Repos/github.com/dcyops/dcyops-quick-install/linux/config/tmux/tmux.conf" "${HOME}/.tmux.conf"

printf "\n[*] Cloning Tmux Plugin Manager (TPM)...\n"
git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm" || 
	{ printf "[!] Error cloning TPM. Exiting...\n"; exit 1; }

printf "\n[*] Switching to latest release of TPM...\n"
cd "${HOME}/.tmux/plugins/tpm" || 
	{ printf "[!] Error changing directory to TPM. Exiting...\n"; exit 1; }

_LATEST_TAG="$(git tag -l | tail -n1)"
git -c advice.detachedHead=false checkout "${_LATEST_TAG}" || 
	{ printf "[!] Error checking out latest tag in TPM. Exiting...\n"; exit 1; }

printf "\n[*] Tmux and TPM installed successfully\n"

unset _LATEST_TAG
