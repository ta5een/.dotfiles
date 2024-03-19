#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autoupdate
  git
  macos
  vi-mode
  zsh-defer
  zsh-syntax-highlighting
)

# By default, OMZ sets the cache directory to "$ZSH/cache", but we'll prefer
# "$XDG_CACHE_HOME/zsh" if possible.
if (( ${+XDG_CACHE_HOME} )); then
  export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
else
  export ZSH_CACHE_DIR="$ZSH/cache"
fi

# Dump completion artefacts into a cache directory, appended with the machine's
# hostname (without any domain information^1) and current ZSH version.
#
# Borrowed from:
# - https://github.com/ohmyzsh/ohmyzsh/issues/7332#issuecomment-624221366
# - https://github.com/ohmyzsh/ohmyzsh/issues/7332#issuecomment-624451063
#
# [1]: Equivalent to `hostname -s` on BSD systems
#      https://man.freebsd.org/cgi/man.cgi?hostname(1)
export ZSH_COMPDUMP="${ZSH_CACHE_DIR}/.zcompdump-${HOST/.*/}-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# GPG may require passphrase every now and then - this line lets it know which
# terminal to use to request the passphrase.
export GPG_TTY=$(tty)

# Load rbenv in the shell
if (( $+commands[rbenv] )); then
  zsh-defer eval "$(rbenv init - zsh)"
fi

# fnm
if (( $+commands[fnm] )); then
  zsh-defer eval "$(fnm env --use-on-cd)"
fi

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

  #Adds the new line and ➜ as the start character.
  printf "\n ➜";
}

# Display Vi mode in prompt
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
