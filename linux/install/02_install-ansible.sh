#!/usr/bin/env bash

# depends: python3

rm -rf "${HOME}/.venv"

printf "[*] Installing Ansible...\n"

[ "$(which python3)" ] || {
  sudo apt-get install -y python3 || 
	{ printf "\n[!] Error installing 'python3' with apt. Exiting...\n"; exit 1; }
}

# Create directories for Ansible and virtual environment
#mkdir -p "${HOME}/.ansible" 
mkdir "${HOME}/.venv" 2>/dev/null

python3 -m venv "${HOME}/.venv/dev" || 
	{ printf "\n[!] Error creating virtual environment for Ansible. Exiting...\n"; exit 1; }

. "${HOME}/.venv/dev/bin/activate"

python -m pip install ansible || 
	{ printf "\n[!] Error installing Ansible. Exiting...\n"; exit 1; }

printf "\n[*] Installed 'Ansible'.\n\n"
