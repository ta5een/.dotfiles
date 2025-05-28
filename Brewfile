# Brewfile
# Generated with: brew bundle dump --describe --cask --formula --tap
# vim: ft=ruby

hostname = `hostname -s`.strip
install_osdev_tools = true
install_serenity_os_deps = install_osdev_tools && true

# Clone of cat(1) with syntax highlighting and Git integration
brew "bat"
# Simple, fast and user-friendly alternative to find
brew "fd"
# Command-line fuzzy finder written in Go
brew "fzf"
# GitHub command-line tool
brew "gh"
# Syntax-highlighting pager for git and diff output
brew "git-delta"
# Lightweight and flexible command-line JSON processor
brew "jq"
# Powerful, lightweight programming language
brew "lua"
# Ambitious Vim-fork focused on extensibility and agility
brew "neovim"
# Friendly PIL fork (Python Imaging Library)
brew "pillow"
# Paste PNG into files
brew "pngpaste"
# PDF rendering library (based on the xpdf-3.0 code base)
brew "poppler"
# File browser
brew "ranger"
# Ruby version manager
brew "rbenv"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Organize software neatly under a single directory tree (e.g. /usr/local)
brew "stow"
# Command-line unarchiving tools supporting multiple formats
brew "unar"
# Check your $HOME for unwanted files and directories
brew "xdg-ninja"
# Blazing fast terminal file manager written in Rust, based on async I/O
brew "yazi"
# Shell extension to navigate your filesystem faster
brew "zoxide"

tap "jesseduffield/lazygit"
# A simple terminal UI for git commands, written in Go
brew "jesseduffield/lazygit/lazygit"

# Developer targeted fonts with a high number of glyphs
cask "font-symbols-only-nerd-font"
# Tools to protect your emails and files
cask "gpg-suite"
# GPU-based terminal emulator
cask "kitty"

case hostname
when "taseen-macbook-m3"
  # Generate compilation database for clang tooling
  brew "bear"
  # Play, record, convert, and stream audio and video
  brew "ffmpeg"
  # Create thumbnails for your video files
  brew "ffmpegthumbnailer"
  # Fast and simple Node.js version manager
  brew "fnm"
  # Tools and libraries to manipulate images in many formats
  brew "imagemagick"
  # ISO/IEC 23008-12:2017 HEIF file format decoder and encoder
  brew "libheif"
  # Fast and user friendly build system
  brew "meson"
  # Netwide Assembler (NASM) is an 80x86 assembler
  brew "nasm"
  # Small build system for use with gyp or CMake
  brew "ninja"
  # Swiss-army knife of markup format conversion
  brew "pandoc"
  # Low-level access to audio, keyboard, mouse, joystick, and graphics
  brew "sdl2"

  tap "oven-sh/bun"
  # Incredibly fast JavaScript runtime, bundler, transpiler and package manager - all in one.
  brew "oven-sh/bun/bun"

  # Compact TeX distribution as alternative to the full TeX Live / MacTeX
  cask "basictex"
end

if install_osdev_tools then
  # Tool for generating GNU Standards-compliant Makefiles
  brew "automake"
  # Open source IA-32 (x86) PC emulator written in C++
  brew "bochs"
  # GNU File, Shell, and Text utilities
  brew "coreutils"
  # GNU awk utility
  brew "gawk"
  # GNU debugger
  brew "gdb"
  # GNU multiple precision arithmetic library
  brew "gmp"
  # Next-gen compiler infrastructure
  brew "llvm"
  # C library for multiple-precision floating-point computations
  brew "mpfr"
  # Object file converter
  brew "objconv"
  # Generic machine emulator and virtualizer
  brew "qemu"
  # Official documentation format of the GNU project
  brew "texinfo"
  # ISO9660+RR manipulation tool
  brew "xorriso"

  if install_serenity_os_deps then
    # Zstandard is a real-time compression algorithm
    brew "zstd"
    # Bourne-Again SHell, a UNIX command interpreter
    brew "bash"
    # Object-file caching compiler wrapper
    brew "ccache"
    # Cross-platform make
    brew "cmake"
    # Utilities for the ext2, ext3, and ext4 file systems
    brew "e2fsprogs"
    # Generates an ext2 filesystem as a normal (non-root) user
    brew "genext2fs"
    # Utility that provides fast incremental file transfer
    brew "rsync"
  end
end
