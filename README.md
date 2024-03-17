# .dotfiles

This repository hosts all the dotfiles that I use on my machines. It allows me to version control my dotfiles to make system configuration changes with confidence, as well as provide a central location to back up my configurations.

This setup follows [this video by Dreams of Autonomy](https://youtu.be/y6XCebnB9gs?si=5mfGeMZARwCyGUi3), utilising GNU Stow to manage symbolic links.

## Required programs

Ensure you have the following installed in your system:

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

## Installation

First, clone the `.dotfiles` repo into your `$HOME` directory using `git`:

```sh
$ git clone --recurse-submodules https://github.com/ta5een/.dotfiles.git
```

> NOTE: The `--recurse-submodules` flag is required to initialize and update submodules when you clone this repository.

Next, use GNU Stow to create symlinks from `$HOME/.dotfiles` to `$HOME`:

```sh
$ cd ~/.dotfiles
$ stow .
```

GNU Stow should have now created symlinks in your `$HOME` directory with the same folder structure as this repository. You can verify this like so:

```sh
$ ls -al ~
lrwxr-xr-x    1 taseen  staff     17  5 Mar 00:16 .bashrc -> .dotfiles/.bashrc
lrwxr-xr-x    1 taseen  staff     20  5 Mar 00:16 .gitconfig -> .dotfiles/.gitconfig
lrwxr-xr-x    1 taseen  staff     18  5 Mar 00:16 .profile -> .dotfiles/.profile
lrwxr-xr-x    1 taseen  staff     17  5 Mar 00:16 .zshenv -> .dotfiles/.zshenv
lrwxr-xr-x    1 taseen  staff     16  5 Mar 00:16 .zshrc -> .dotfiles/.zshrc
# ... and so on ...

$ ls -al ~/.config
lrwxr-xr-x   1 taseen  staff    25  5 Mar 00:16 bat -> ../.dotfiles/.config/bat
lrwxr-xr-x   1 taseen  staff    25  5 Mar 00:16 kitty -> ../.dotfiles/.config/kitty
lrwxr-xr-x   1 taseen  staff    25  5 Mar 00:16 lazygit -> ../.dotfiles/.config/lazygit
lrwxr-xr-x   1 taseen  staff    25  5 Mar 00:16 nvim -> ../.dotfiles/.config/nvim
lrwxr-xr-x   1 taseen  staff    25  5 Mar 00:16 skhd -> ../.dotfiles/.config/skhd
lrwxr-xr-x   1 taseen  staff    26  5 Mar 00:16 yabai -> ../.dotfiles/.config/yabai
# ... and so on ...
```

> NOTE: The output above is only a short snippet to serve as an example. You may have a different output.

## Further reading

Refer to [this article by System Crafters](https://systemcrafters.net/managing-your-dotfiles/using-gnu-stow/) for a more comprehensive description of this workflow.
