# dotfiles

This repository contains my dotfiles and its installation script.

## Requirements

Setting files expect each version or later:

- Git 1.7.12
- Vim 7.4.1742, 8.0.1596 or Neovim 0.20
- Zsh 5.3
- tmux 2.4

## Installation

The script needs git and bash.

```sh
$ git clone https://github.com/chitoku-k/dotfiles.git
$ cd dotfiles
$ ./install
```

Choose whatever package you want to install and press <kbd>Enter</kbd>.

<img src="https://raw.githubusercontent.com/wiki/chitoku-k/dotfiles/installer.gif" alt="" width="400">

Most dotfiles will follow [XDG Base Directory Specification](https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html).

## Local Configuration

### Zsh

Use `$XDG_CONFIG_HOME/zsh/local/*.zsh`.

### Git

Use `$HOME/.gitconfig`.

## Prerequisites

Vim and tmux depend on environment variables as follows:

- `$XDG_CACHE_HOME`: Defaults to `~/.cache`
- `$XDG_CONFIG_HOME`: Defaults to `~/.config`
