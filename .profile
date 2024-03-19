#!/bin/sh
#
# .profile - Bash file loaded on login. Also sourced from `.zshenv`.
#

# Set default editor to Neovim
export EDITOR=nvim

# NOTE: Adhere to the XDG Base Directory specification, even on macOS.

# Directory for user-specific configuration files
export XDG_CONFIG_HOME="$HOME/.config"
[ -d $XDG_CONFIG_HOME ] || mkdir -p $XDG_CONFIG_HOME

# Directory for user-specific non-essential (cached) data
export XDG_CACHE_HOME="$HOME/.cache"
[ -d $XDG_CACHE_HOME ] || mkdir -p $XDG_CACHE_HOME

# Directory for user-specific data files
export XDG_DATA_HOME="$HOME/.local/share"
[ -d $XDG_DATA_HOME ] || mkdir -p $XDG_DATA_HOME

# Directory for user-specific state files
export XDG_STATE_HOME="$HOME/.local/state"
[ -d $XDG_STATE_HOME ] || mkdir -p $XDG_STATE_HOME

# Bash history file
BASH_HISTFILE_HOME="$XDG_STATE_HOME/bash"
export HISTFILE="$BASH_HISTFILE_HOME/history"
[ -d $BASH_HISTFILE_HOME ] || mkdir -p $BASH_HISTFILE_HOME
