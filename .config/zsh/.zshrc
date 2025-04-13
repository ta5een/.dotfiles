#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# NOTE: macOS behaves differently when sourcing Zsh configs and setting PATH.
#
# Specifically, macOS runs a program named `path_helper` to resolve the `PATH`
# variable. Unfortunately, this tool messes up the ordering of existing PATHs.
# While this has not proved to be detrimental so far, it drifts away from
# expected behaviour that may cause issues in the future.
#
# Additionally, all interactive shell sessions on macOS are also login shells.
# This is not the case on other Unix systems, most notably Linux. As a result,
# the previous implementation of defining environment variables in `.zprofile`
# will not work on non-macOS systems.
#
# Due to these reasons, I've moved all environment variables into this file.
# However, since these variables will now only be available in interactive
# shells, I'm unsure if this will break existing CLI and GUI applications. I'll
# have to keep this in mind while I daily-drive this patch.
#
# For reference, heres how Zsh startup files are sourced in macOS:
#
# 1. `/etc/zshenv` (no longer exists on macOS by default)
# 2. `~/.zshenv`
# 3. login mode:
#   i.  `/etc/zprofile` (calling `path_helper`)
#   ii. `~/.zprofile`
# 4. interactive: `/etc/zshrc` `~/.zshrc`
# 5. login mode: `/etc/zlogin` `~/.zlogin`
#
# Refer to the following link for more information:
# https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2

# User scripts
export PATH="$PATH:$HOME/.local/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Zsh history file
ZSH_HISTFILE_HOME="$XDG_STATE_HOME/zsh"
export HISTFILE="$ZSH_HISTFILE_HOME/history"
[ -d "$ZSH_HISTFILE_HOME" ] || mkdir -p "$ZSH_HISTFILE_HOME"

# Prefer "$XDG_CACHE_HOME/zsh" as cache directory if possible.
if (( ${+XDG_CACHE_HOME} )); then
  export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
else
  export ZSH_CACHE_DIR="$ZSH/cache" # Default set by oh-my-zsh
fi

# Create the cache directory if it doesn't exist.
[ -d "$ZSH_CACHE_DIR" ] || mkdir -p "$ZSH_CACHE_DIR"

# Dump completion artefacts into a cache directory, appended with the machine's
# hostname without any domain information (refer to `~/.profile` for more
# information) and the current Zsh version.
#
# Borrowed from:
# - https://github.com/ohmyzsh/ohmyzsh/issues/7332#issuecomment-624221366
# - https://github.com/ohmyzsh/ohmyzsh/issues/7332#issuecomment-624451063
export ZSH_COMPDUMP="${ZSH_CACHE_DIR}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Configure Zsh Vi Mode settings
# This must be defined before the plugin is sourced
# https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#configuration-function
function zvm_config() {
  # Always starting with insert mode for each command line
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

  # Configure the surround bindkey with the following behaviours:
  #   sa"  -> Add " for visual selection
  #   sd"  -> Delete "
  #   sr"' -> Change " to '
  ZVM_VI_SURROUND_BINDKEY="s-prefix"
}

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autoupdate
  git
  macos
  zsh-defer
  zsh-vi-mode
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Oh My Zsh defines SHORT_HOST as the computer's name on macOS, which is a
# human-readable name for the machine. However, this name typically contains
# spaces and apostrophes, making it cumbersome to type literally. To make
# things easier, I'll redefine it to HOST with the domain stripped off instead.
# This is effectively the same as `hostname -s`, however this flag is not
# available on all POSIX systems.
export SHORT_HOST="${HOST/.*/}"

# Host-specific variables
case "$SHORT_HOST" in
  taseen-macbook-work)
    # TODO: Remove this switch case

    # PNPM
    export PNPM_HOME="$HOME/Library/pnpm"
    export PATH="$PNPM_HOME:$PATH"

    # Android
    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export PATH="$PATH:$ANDROID_HOME/emulator"
    export PATH="$PATH:$ANDROID_HOME/tools"
    export PATH="$PATH:$ANDROID_HOME/tools/bin"
    export PATH="$PATH:$ANDROID_HOME/platform-tools"

    # Flutter requires `CHROME_EXECUTABLE` to develop for the web
    export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

    # Added by Toolbox App
    export PATH="$PATH:/usr/local/bin"

    # Added by Docker Desktop
    source "$HOME/.docker/init-zsh.sh" || true

    # Added by Cargo
    . "$HOME/.cargo/env"

    # ZVM
    export ZVM_PATH="$XDG_DATA_HOME/zvm"
    export ZVM_INSTALL="$ZVM_PATH/self"
    export PATH="$PATH:$ZVM_PATH/bin"
    export PATH="$PATH:$ZVM_INSTALL"
    ;;

  taseen-macbook-m3)
    # PNPM
    export PNPM_HOME="$HOME/Library/pnpm"
    export PATH="$PNPM_HOME:$PATH"

    # ZVM
    export ZVM_PATH="$XDG_DATA_HOME/zvm"
    export ZVM_INSTALL="$ZVM_PATH/self"
    export PATH="$PATH:$ZVM_PATH/bin"
    export PATH="$PATH:$ZVM_INSTALL"
    ;;

  taseen-mint)
    # Nothing here yet...
    ;;
esac

# GPG may require passphrase every now and then - this line lets it know which
# terminal to use to request the passphrase.
export GPG_TTY=$(tty)

# Load rbenv in the shell
(( $+commands[rbenv] )) && zsh-defer eval "$(rbenv init - zsh)"
# fnm
(( $+commands[fnm] )) && zsh-defer eval "$(fnm env --use-on-cd)"
# Set up fzf key bindings and fuzzy completion
(( $+commands[fzf] )) && zsh-defer eval "$(fzf --zsh)"
# zoxide (this code should appear near the end of this file)
(( $+commands[zoxide] )) && zsh-defer eval "$(zoxide init zsh)"

# jEnv
if (( $+commands[jenv] )); then
  export PATH="$HOME/.jenv/bin:$PATH"
  zsh-defer eval "$(jenv init -)"
fi

# Customise prompt
DEFAULT_USER=$USER
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
      print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
      print -n "%{%k%}"
  fi

  print -n "%{%f%}"
  CURRENT_BG=''

  # Adds the new line and ➜ as the start character.
  printf "\n ➜";
}

# Change comment highlight style
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=magenta,bold'
