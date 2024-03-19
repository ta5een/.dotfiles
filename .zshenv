#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# Share environment variables between Bash and Zsh.
source "$HOME/.profile"

# NOTE: This file needs to live at ~/.zshenv, not in $ZDOTDIR!

# TODO: Move all Zsh config files EXCEPT .zshenv
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
