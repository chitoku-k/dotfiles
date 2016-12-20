<?php
class Installer
{
    public function __construct()
    {
        $this->console = new Console();
        $this->packages = array(
            new Package(
                2,
                'dotfiles',
                '.zshrc',
                'Configuration for Zsh'
            ),
            new Package(
                2,
                'dotfiles',
                '.tmux.conf',
                'Configuration for tmux'
            ),
            new Package(
                2,
                'dotfiles',
                '.vimrc',
                'Configuration for Vim',
                function ($self) {
                    $self->symlink($self->name);
                    $self->symlink('.vim/userautoload');
                }
            ),
            new Package(
                2,
                'dotfiles',
                '.gvimrc',
                'Configuration for GVim/MacVim'
            ),
            new Package(
                2,
                'dotfiles',
                '.vsvimrc',
                'Configuration for VsVim'
            ),
            new Package(
                5,
                'shell',
                'base16-shell',
                'Base16 for Shells',
                function () {
                    passthru('git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell');
                }
            ),
            new Package(
                5,
                'zsh',
                'zsh-syntax-highlighting',
                'Fish shell like syntax highlighting for Zsh',
                function () {
                    passthru('git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh-syntax-highlighting');
                }
            ),
            new Package(
                5,
                'tmux',
                'tpm',
                'Tmux Plugin Manager',
                function () {
                    passthru('git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm');
                }
            ),
            new Package(
                5,
                'vim',
                'vim-plug',
                'A minimalist Vim plugin manager',
                function () {
                    passthru('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim');
                    passthru('vim +PlugInstall +qa');
                }
            ),
        );
    }

    protected function parsePackages($packages)
    {
        $result = array();
        foreach (explode(' ', $packages) as $num) {
            if (preg_match('/^(\d+)$/', $num, $matches)) {
                $result[] = +$num;
                continue;
            }
            if (preg_match('/^(\d+)-(\d+)$/', $num, $matches)) {
                list(, $start, $end) = $matches;
                $result = array_merge($result, range($start, $end));
                continue;
            }
        }

        $result = array_unique($result);
        sort($result);
        return $result;
    }

    public function execute()
    {
        foreach ($this->packages as $index => $package) {
            $this->console->printMessage($index + 1, false, 0, 3);
            $this->console->printMessage(" {$package->category}/", true, $package->category_color);
            $this->console->printMessage("{$package->name}\n", true);
            $this->console->printMessage("    {$package->description}\n");
        }

        $this->console->printArrow(true, 3);
        $this->console->printMessage("Enter n° of packages to be installed (ex: 1 2 3 or 1-3)\n", true);

        $this->console->printArrow(true, 3);
        $this->console->printLine(true);

        $this->console->printArrow(true, 3);

        $numbers = $this->parsePackages($this->console->read());
        $names = array();
        if (!$numbers) {
            return;
        }
        foreach ($numbers as $number) {
            if (!isset($this->packages[$number - 1])) {
                return;
            }
            $names[] = $this->packages[$number - 1]->name;
        }

        $this->console->printMessage("\nPackages (" . count($numbers) . ') ', true);
        $this->console->printMessage(implode('  ', $names) . "\n\n");

        $this->console->printMessage(':: ', true, 4);
        $this->console->printMessage('Proceed with installation? [Y/n] ', true);

        switch (strtolower($this->console->read())) {
            case '':
            case 'y':
                break;
            default:
                return;
        }

        $this->console->printMessage(':: ', true, 4);
        $this->console->printMessage("Processing package changes...\n", true);

        $count = count($numbers);
        foreach ($numbers as $index => $number) {
            $index++;
            $package = $this->packages[$number - 1];
            $this->console->printMessage("({$index}/{$count}) installing {$package->name}\n");
            $package();
        }
    }
}
