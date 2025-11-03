# dotfiles

This repository contains my dotfiles and its installation script.

## Requirements

Setting files expect each version or later:

- Git 1.7.12
- Neovim 0.8.0
- Zsh 5.0.2
- Bash 3.2.57
- PowerShell 7.x
- tmux 3.1

## Optional

- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
- [sharkdp/bat](https://github.com/sharkdp/bat)
- [sharkdp/fd](https://github.com/sharkdp/fd)

## Installation

### Zsh/Bash

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

### PowerShell

> [!NOTE]  
> In order to create a symbolic link on Windows, PowerShell needs to run either
> as administrator or with Developer Mode activated.  
> [Symlinks in Windows 10! - Windows Developer Blog](https://blogs.windows.com/windowsdeveloper/2016/12/02/symlinks-windows-10/)

Open `conhost.exe` and run:

```
> Invoke-Expression (Invoke-WebRequest dot.chitoku.jp/install.ps1)
```

To manually install:

```
> git clone https://github.com/chitoku-k/dotfiles.git
> Set-Location dotfiles
> .\install.ps1
```

## Local Configuration

### Zsh

Use `$XDG_CONFIG_HOME/zsh/local/*.zsh`.

### Bash

Use `$XDG_CONFIG_HOME/bash/local/*.bash`.

### tmux

Use `$XDG_CONFIG_HOME/tmux/local/*.conf`.

### PowerShell

Use `$HOME\Documents\PowerShell\local\*.ps1`.

### Git

Use `$HOME/.gitconfig`.

## Prerequisites

tmux depends on environment variables as follows:

- `$XDG_CONFIG_HOME`: Defaults to `~/.config`
- `$XDG_DATA_HOME`: Defaults to `~/.local/share`
