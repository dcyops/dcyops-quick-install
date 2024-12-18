#!/usr/bin/env bash

[ "$(which zsh)" ] || {
  printf "[*] Installing Zsh...\n"
  sudo apt-get install -y --no-install-recommends --no-install-suggests zsh || 
  	{ printf "\n[!] Error installing 'zsh' with apt. Exiting...\n"; exit 1; }
}

rm -rf "${HOME}/.zsh" 2>/dev/null

mkdir     "${HOME}/.zsh"             2>/dev/null
mkdir     "${HOME}/.zsh/plugins"     2>/dev/null
mkdir     "${HOME}/.zsh/plugins/zsh" 2>/dev/null
mkdir     "${HOME}/.zsh/plugins/fzf" 2>/dev/null

printf "\n[*] Cloning 'zsh-syntax-highlighting'...\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}/.zsh/plugins/zsh/zsh-syntax-highlighting" || 
	{ printf "\n[!] Error cloning 'zsh-syntax-highlighting'. Exiting...\n"; exit 1; }

printf "\n[*] Cloning 'zsh-autosuggestions'...\n"
git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.zsh/plugins/zsh/zsh-autosuggestions" || 
	{ printf "\n[!] Error cloning 'zsh-autosuggestions'. Exiting...\n"; exit 1; }

printf "\n[*] Cloning 'zsh-autopair'...\n"
git clone https://github.com/hlissner/zsh-autopair "${HOME}/.zsh/plugins/zsh/zsh-autopair" || 
	{ printf "\n[!] Error cloning 'zsh-autopair'. Exiting...\n"; exit 1; }

printf "\n[*] Cloning 'fzf'...\n"
git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.zsh/plugins/fzf" || 
	{ printf "\n[!] Error cloning 'fzf'. Exiting...\n"; exit 1; }

"${HOME}/.zsh/plugins/fzf/install"

printf "\n[*] Creating symbolic links for Zsh configuration files...\n"
ln -sfv "${HOME}/.Repos/github.com/dcyops/dcyops-quick-install/linux/config/zsh/zshrc" "${HOME}/.zshrc"
ln -sfv "${HOME}/.Repos/github.com/dcyops/dcyops-quick-install/linux/config/zsh/zshrc.local" "${HOME}/.zshrc.local"

sudo ln -sfv "${HOME}/.Repos/github.com/dcyops/dcyops-quick-install/linux/config/zsh/root_zshrc" "/root/.zshrc"
sudo ln -sfv "${HOME}/.Repos/github.com/dcyops/dcyops-quick-install/linux/config/zsh/root_zshrc.local" "/root/.zshrc.local"

printf "[*] Setting zsh as the default shell\n"
chsh -s /usr/bin/zsh

printf "\n\n[*] Zsh and plugins installed successfully\n"
