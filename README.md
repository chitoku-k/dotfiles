# dotfiles

This repository contains my dotfiles and its installation script.

## Requirements

Setting files expect each version or later:

- Git 1.7.12
- Vim 7.4.160 or Neovim 0.3.0
- Zsh 5.0.2
- Bash 3.5.27
- tmux 2.4

## Optional

- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
- [sharkdp/bat](https://github.com/sharkdp/bat)
- [sharkdp/fd](https://github.com/sharkdp/fd)

## Installation

The script needs zsh and optionally git for the plugins.

For zsh:

```sh
$ source <(curl -sL dot.chitoku.jp)
```

For bash:

```sh
$ eval "$(curl -sL dot.chitoku.jp)"
```

To manually install:

```sh
$ git clone https://github.com/chitoku-k/dotfiles.git
$ cd dotfiles
$ ./install
```

Choose whatever packages you want to install and press <kbd>Enter</kbd>.

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
