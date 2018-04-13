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

    public function symlink($name, $target)
    {
        if (is_link($target)) {
            unlink($target);
        }
        if (file_exists($target)) {
            echo "File exists: {$name}\n";
            return;
        }

        if (!file_exists(dirname($target))) {
            mkdir(dirname($target), 0755, true);
        }

        symlink(realpath($name), $target);
    }

    public function cloneGit($repo, $target, $source = 'https://github.com/')
    {
        return passthru(
            sprintf(
                'git clone --depth 1 %s %s',
                escapeshellarg("{$source}{$repo}.git"),
                escapeshellarg($target)
            )
        );
    }

    public function __get($name)
    {
        switch ($name) {
            case 'home': {
                if (DIRECTORY_SEPARATOR === '\\') {
                    return $_SERVER['USERPROFILE'];
                }
                return $_SERVER['HOME'];
            }
            case 'config': {
                if (DIRECTORY_SEPARATOR === '\\') {
                    return $_SERVER['LOCALAPPDATA'];
                }
                return $this->xdgconfig;
            }
            case 'roaming': {
                if (DIRECTORY_SEPARATOR === '\\') {
                    return $_SERVER['APPDATA'];
                }
                return $this->xdgconfig;
            }
            case 'xdgconfig': {
                if (isset($_SERVER['XDG_CONFIG_HOME'])) {
                    return $_SERVER['XDG_CONFIG_HOME'];
                }
                return $_SERVER['HOME'] . DIRECTORY_SEPARATOR . '.config';
            }
            case 'xdgcache': {
                if (isset($_SERVER['XDG_CACHE_HOME'])) {
                    return $_SERVER['XDG_CACHE_HOME'];
                }
                return $_SERVER['HOME'] . DIRECTORY_SEPARATOR . '.cache';
            }
        }
    }

    public function __invoke()
    {
        $callback = $this->callback;
        return $callback($this);
    }
}
