#!/bin/zsh
#
# .zprofile - Zsh file loaded on login.
#

# NOTE: To avoid potential issues that `path_helper` may cause when prepending
# appending and prepending to `$PATH`, all environment variables will be set
# in this file. Refer to the link below for more information.
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

# Share environment variables between Bash and Zsh.
source "$HOME/.profile"
