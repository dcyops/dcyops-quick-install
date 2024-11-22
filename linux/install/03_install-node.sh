#!/usr/bin/env bash

printf "[*] Installing NVM & Node.js...\n"

_URL="https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh"

rm -rf "${HOME}/.nvm" "${HOME}/.node*" 2>/dev/null

curl -o- "${_URL}" | bash ||  
	{ printf "\n[!] Error installing NVM. Exiting...\n"; exit 1; }

. "${HOME}/.nvm/nvm.sh" ||  
	{ printf "\n[!] Error sourcing NVM. Exiting...\n"; exit 1; }

nvm install 20 ||  
	{ printf "\n[!] Error installing Node.js. Exiting...\n"; exit 1; }

ln -sfv "$(find "${HOME}"/.nvm/versions/node/ -maxdepth 1 -type d -name 'v*' | sort -V | tail -n 1)/bin/node"  "${HOME}/.local/bin/npm"

_NODE_VERSION="$(node -v)"
printf "\n[*] Installed Node.js version: %s\n" "${_NODE_VERSION}"

_NPM_VERSION="$(npm -v)"
printf "[*] Installed NPM version: %s\n" "${_NPM_VERSION}"

unset _URL _NODE_VERSION _NPM_VERSION
