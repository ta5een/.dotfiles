#!/bin/zsh
#
# .zprofile - Zsh file loaded on login.
#

# NOTE: To avoid `path_helper` from causing potential issues when appending and
# prepending to `$PATH`, all environment variables will be set in this file.
# Please refer to the link below for more information.
#
# > For zsh, the order is like this:
# > 1. `/etc/zshenv` (no longer exists on macOS by default)
# > 2. `~/.zshenv`
# > 3. login mode:
# >   i.  `/etc/zprofile` (calling `path_helper`)
# >   ii. `~/.zprofile`
# > 4. interactive: `/etc/zshrc` `~/.zshrc`
# > 5. login mode: `/etc/zlogin` `~/.zlogin`
#
# SEE: https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2

case "$SHORT_HOST" in
  taseen-macbook-work)
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
    # TODO: This appears to be redundant?
    export PATH="$PATH:/usr/local/bin"

    # Added by Docker Desktop
    source "$HOME/.docker/init-bash.sh" || true

    # Added by Cargo
    . "$HOME/.cargo/env"
    ;;

  taseen-mint)
    # Nothing here yet...
    ;;
esac
