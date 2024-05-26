# Brewfile
# Generated with: brew bundle dump --describe --cask --formula --tap
# vim: ft=ruby

hostname = `hostname -s`.strip
is_work_machine = (hostname == "taseen-macbook-work")

# ===[ SHARED BREWFILE ]=======================================================

# ---[ Taps ]------------------------------------------------------------------

tap "homebrew/bundle"
tap "homebrew/cask-fonts"
tap "homebrew/services"
tap "jesseduffield/lazygit"
tap "koekeishiya/formulae"
tap "oven-sh/bun"

# ---[ Formulae ]--------------------------------------------------------------

# Text processor and publishing toolchain for AsciiDoc
brew "asciidoctor"
# Clone of cat(1) with syntax highlighting and Git integration
brew "bat"
# Simple, fast and user-friendly alternative to find
brew "fd"
# Play, record, convert, and stream audio and video
brew "ffmpeg"
# Fast and simple Node.js version manager
brew "fnm"
# Command-line fuzzy finder written in Go
brew "fzf"
# GitHub command-line tool
brew "gh"
# Syntax-highlighting pager for git and diff output
brew "git-delta"
# Tools and libraries to manipulate images in many formats
brew "imagemagick"
# Manage your Java environment
brew "jenv"
# ISO/IEC 23008-12:2017 HEIF file format decoder and encoder
brew "libheif"
# Ambitious Vim-fork focused on extensibility and agility
brew "neovim"
# Development kit for the Java programming language
brew "openjdk@11"
# Development kit for the Java programming language
brew "openjdk@17"
# Development kit for the Java programming language
brew "openjdk@8"
# Swiss-army knife of markup format conversion
brew "pandoc"
# Friendly PIL fork (Python Imaging Library)
brew "pillow"
# Paste PNG into files
brew "pngpaste"
# Generic machine emulator and virtualizer
brew "qemu"
# File browser
brew "ranger"
# Ruby version manager
brew "rbenv"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Organize software neatly under a single directory tree (e.g. /usr/local)
brew "stow"
# Check your $HOME for unwanted files and directories
brew "xdg-ninja"
# A simple terminal UI for git commands, written in Go
brew "jesseduffield/lazygit/lazygit"
# Simple hotkey-daemon for macOS.
brew "koekeishiya/formulae/skhd"
# A tiling window manager for macOS based on binary space partitioning.
brew "koekeishiya/formulae/yabai"
# Incredibly fast JavaScript runtime, bundler, transpiler and package manager - all in one.
brew "oven-sh/bun/bun"

# ---[ Casks ]-----------------------------------------------------------------

# Compact TeX distribution as alternative to the full TeX Live / MacTeX
cask "basictex"
# Developer targeted fonts with a high number of glyphs
cask "font-symbols-only-nerd-font"
# GPU-based terminal emulator
cask "kitty"
# Modern programming language in the Lisp/Scheme family
cask "racket"

# ===[ WORK MACHINE BREWFILE ]=================================================

if is_work_machine then
  # ---[ Formulae ]------------------------------------------------------------

  # Enables you to reproduce the CircleCI environment locally
  brew "circleci"
  # GNU Transport Layer Security (TLS) Library
  brew "gnutls"
  # Install and debug iPhone apps from the command-line
  brew "ios-deploy"
  # Object-relational database system
  brew "postgresql@14"
  # Display and control your Android device
  brew "scrcpy"
  # Validating, recursive, caching DNS resolver
  brew "unbound"

  # ---[ Casks ]---------------------------------------------------------------

  # UI toolkit for building applications for mobile, web and desktop
  cask "flutter"
  # Install and switch between multiple versions of Xcode
  cask "xcodes"
end
