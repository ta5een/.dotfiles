#!/bin/sh
#
# .profile - Bash file loaded on login. Also sourced from `.zshenv`.
#

# Set default editor to Neovim
export EDITOR=nvim

# BSD systems append domain information to the hostname, for example:
#
#     taseen-macbook-work.local
#
# Since `ComputerName` does not have this detail appended, we'll attempt to use
# it if possible. Otherwise, use the hostname as provided and strip of the end
# by substituting it with an empty string instead.
#
# This behaviour is equivalent to `hostname -s` on BSD systems:
# - https://man.freebsd.org/cgi/man.cgi?hostname(1)
#
# Borrowed from oh-my-zsh's source code:
# - https://github.com/ohmyzsh/ohmyzsh/blob/0fed36688f9a60d8b1f2182f27de7fdc8a1e6b72/oh-my-zsh.sh#L104-L110
if [[ "$OSTYPE" = darwin* ]]; then
  # macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
  export SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST="${HOST/.*/}"
else
  export SHORT_HOST="${HOST/.*/}"
fi

# NOTE: Adhere to the XDG Base Directory specification, even on macOS.

# Directory for user-specific configuration files
export XDG_CONFIG_HOME="$HOME/.config"
[ -d "$XDG_CONFIG_HOME" ] || mkdir -p "$XDG_CONFIG_HOME"

# Directory for user-specific non-essential (cached) data
export XDG_CACHE_HOME="$HOME/.cache"
[ -d "$XDG_CACHE_HOME" ] || mkdir -p "$XDG_CACHE_HOME"

# Directory for user-specific data files
export XDG_DATA_HOME="$HOME/.local/share"
[ -d "$XDG_DATA_HOME" ] || mkdir -p "$XDG_DATA_HOME"

# Directory for user-specific state files
export XDG_STATE_HOME="$HOME/.local/state"
[ -d "$XDG_STATE_HOME" ] || mkdir -p "$XDG_STATE_HOME"

# Bash history file
BASH_HISTFILE_HOME="$XDG_STATE_HOME/bash"
export HISTFILE="$BASH_HISTFILE_HOME/history"
[ -d "$BASH_HISTFILE_HOME" ] || mkdir -p "$BASH_HISTFILE_HOME"
