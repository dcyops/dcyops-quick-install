#!/usr/bin/env bash

_LOGFILE_PATH="/tmp/quick-install.log"

banner() {
printf "+------------------------------------------+"
printf "| %-40s |\n" "`date`"
printf "|                                          |"
printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
printf "+------------------------------------------+"
}

touch "${_LOGFILE_PATH}"
chmod 777 "${_LOGFILE_PATH}"

mkdir "${HOME}/.local"       2>/dev/null
mkdir "${HOME}/.local/src"   2>/dev/null
mkdir "${HOME}/.local/share" 2>/dev/null
mkdir "${HOME}/.local/bin"   2>/dev/null
mkdir "${HOME}/.config"      2>/dev/null

find "${HOME}/.config/"   -type l -exec rm {} + 2>/dev/null
find "${HOME}/.local/bin" -type l -exec rm {} + 2>/dev/null
find "${HOME}/.cargo/bin" -type l -exec rm {} + 2>/dev/null
find "${HOME}" -type l -name '.zshrc' -name '.zshrc.local' -exec rm {} + 2>/dev/null

banner '01_install-most-stuff-with-apt'     | tee --append "${_LOGFILE_PATH}"
bash install/01_install-most-stuff-with-apt | tee --append "${_LOGFILE_PATH}"

banner '02_install-ansible'     | tee --append "${_LOGFILE_PATH}"
bash install/02_install-ansible | tee --append "${_LOGFILE_PATH}"

banner '03_install-node'     | tee --append "${_LOGFILE_PATH}"
bash install/03_install-node | tee --append "${_LOGFILE_PATH}"

banner '04_install-zsh'     | tee --append "${_LOGFILE_PATH}"
bash install/04_install-zsh | tee --append "${_LOGFILE_PATH}"

banner '05_install-terraform'     | tee --append "${_LOGFILE_PATH}"
bash install/05_install-terraform | tee --append "${_LOGFILE_PATH}"

banner '06_install-lynx'     | tee --append "${_LOGFILE_PATH}"
bash install/06_install-lynx | tee --append "${_LOGFILE_PATH}"

banner '07_install-tmux'     | tee --append "${_LOGFILE_PATH}"
bash install/07_install-tmux | tee --append "${_LOGFILE_PATH}"


# https://github.com/sharkdp/bat
ln -s /usr/bin/batcat ~/.local/bin/bat

#bash config/setup.sh

unset _LOGFILE_PATH
