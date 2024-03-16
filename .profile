# Set default editor to Neovim
export EDITOR=nvim

# Set default configuration folder to `~/.config`
export XDG_CONFIG_HOME="$HOME/.config"

# TODO: Move all Zsh config files EXCEPT .zshenv
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

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

# Added by Cargo
. "$HOME/.cargo/env"

# Added by Toolbox App
export PATH="$PATH:/usr/local/bin"

# Added by Docker Desktop
source "$HOME/.docker/init-bash.sh" || true
