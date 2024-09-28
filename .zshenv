#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: This file needs to reside in $HOME, not in $ZDOTDIR!

# Tie the $PATH variable to the $path array. This will also ensure only unique
# values are present in $path.
typeset -U path PATH

# Share environment variables between Bash and Zsh.
source "$HOME/.profile"

# All other Zsh files are located in the config folder.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Add Homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
