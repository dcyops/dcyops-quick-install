#!/usr/bin/env bash

mkdir -p "${HOME}/.local/share/fonts" 2>/dev/null
cp -rv ../config/fonts/* "${HOME}/.local/share/fonts" 2>/dev/null
fc-cache -fv 2>/dev/null
