#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# Share environment variables between Bash and Zsh.
source "$HOME/.profile"

# NOTE: This file needs to live at ~/.zshenv, not in $ZDOTDIR!

# All other Zsh files are located in the config folder.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
