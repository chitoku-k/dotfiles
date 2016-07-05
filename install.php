#!/usr/bin/php
<?php
class Package
{
    public function __construct($category_color, $category, $name, $description, $callback = null)
    {
        $this->category_color = $category_color;
        $this->category = $category;
        $this->name = $name;
        $this->description = $description;
        $this->callback = $callback;
    }

    public function __invoke()
    {
        if (!$this->callback) {
            return symlink(realpath($this->name), $_SERVER['HOME'] . '/' . $this->name);
        }
        $callback = $this->callback;
        return $callback();
    }
}

class Console
{
    public function getEscapeSequence($codes)
    {
        $out = implode(';', array_unique((array)$codes));
        return "\033[{$out}m";
    }

    public function printMessage($message, $bold = false, $fg_color = 9, $bg_color = 9)
    {
        echo $this->getEscapeSequence(array_filter(array((int)$bold, 30 + $fg_color, 40 + $bg_color)));
        echo $message;
        echo $this->getEscapeSequence(0);
    }

    public function printArrow($bold = false, $fg_color = 9, $bg_color = 9)
    {
        $this->printMessage('==> ', $bold, $fg_color, $bg_color);
    }

    public function printLine($bold = false, $fg_color = 9, $bg_color = 9)
    {
        $this->printMessage(str_repeat('-', 43) . "\n", $bold, $fg_color, $bg_color);
    }

    public function read()
    {
        return trim(fgets(STDIN));
    }
}

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
                'Configuration for Vim'
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
        $this->console->printMessage("インストールするパッケージの番号を入力してください (例: 1 2 3 or 1-3)\n", true);

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

        $this->console->printMessage("\nパッケージ (" . count($numbers) . ') ', true);
        $this->console->printMessage(implode('  ', $names) . "\n\n");

        $this->console->printMessage(':: ', true, 4);
        $this->console->printMessage('インストールを行いますか？ [Y/n] ', true);

        switch (strtolower($this->console->read())) {
            case '':
            case 'y':
                break;
            default:
                return;
        }

        $this->console->printMessage(':: ', true, 4);
        $this->console->printMessage("パッケージの変更を処理しています...\n", true);

        $count = count($numbers);
        foreach ($numbers as $index => $number) {
            $index++;
            $package = $this->packages[$number - 1];
            $this->console->printMessage("({$index}/{$count}) インストール {$package->name}\n");
            $package();
        }
    }
}

$installer = new Installer();
$installer->execute();
