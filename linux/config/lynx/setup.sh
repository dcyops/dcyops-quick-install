#!/usr/bin/env bash

_CONFIG_PATH="$(dirname "$(readlink -f "$0")")"

for cmd in "${_CONFIG_PATH}/bin/"*; do
    ln -sfv "$cmd" "$HOME/.local/bin/$(basename "$cmd")"
done

unset _CONFIG_PATH
