#!/bin/sh
#
# .profile - Bash file loaded on login. Also sourced from `.zshenv`.
#

# Set default editor to Neovim
export EDITOR=nvim

# TODO: Ensure to move configurations if their programs respect these
export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_DATA_HOME="$HOME/.local/share"
