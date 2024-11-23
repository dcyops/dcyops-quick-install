#!/usr/bin/env bash

set -e
trap 'echo "Error on line $LINENO: $BASH_COMMAND returned $?" | tee -a "${LOGFILE}"' ERR

SCRIPT_PATH="$(dirname "$(readlink -f "$0")")"
LOGFILE="/tmp/quick-install.log"
DIRS=(
    "${HOME}/.local"
    "${HOME}/.local/src"
    "${HOME}/.local/share"
    "${HOME}/.local/bin"
    "${HOME}/.config"
)
readonly LOGFILE DIRS SCRIPT_PATH
mkdir -p "${DIRS[@]}" 2>/dev/null

# Cleanup existing symlinks
find "${HOME}/.config/" "${HOME}/.local/bin" "${HOME}/.cargo/bin" -type l -exec rm {} + 2>/dev/null
find "${HOME}" -type l \( -name '.zshrc' -o -name '.zshrc.local' \) -exec rm {} + 2>/dev/null

for SCRIPT in "${SCRIPT_PATH}/install/"*; do
    printf "+------------------------------------------+\n"
    printf "| %-40s |\n" "$(date)"
    printf "|                                          |\n"
    printf "|\033[1m %-40s \033[0m|\n" "${SCRIPT}"
    printf "+------------------------------------------+\n" | tee -a "${LOGFILE}"

    $SCRIPT | tee -a "${LOGFILE}"
done


