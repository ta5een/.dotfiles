# .dotfiles

This repository hosts all the dotfiles that I use on my machines. It allows me
to version control my dotfiles to make system configuration changes with
confidence, as well as provide a central location to back up my configurations.

The idea for this setup was inspired by [this blog][a-simpler-way-to-manage-your-dotfiles]
by Anand Iyer.

## First time setup

```sh
$ git init --bare $HOME/.dotfiles
$ alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ dotfiles config --local status.showUntrackedFiles no
$ dotfiles remote add origin https://github.com/ta5een/.dotfiles.git
```

## Operations

```sh
$ cd $HOME
$ dotfiles add .zshrc
$ dotfiles commit -m "Add .zshrc"
$ dotfiles push
```

## New machine setup

To set up a new machine, clone the repo to a temporary directory. This is
because you might have some default config files in your $HOME which will cause
a normal clone to fail.

```sh
$ git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ta5een/.dotfiles.git tmpdotfiles
$ rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
$ rm -r tmpdotfiles
```

[a-simpler-way-to-manage-your-dotfiles]: https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/
