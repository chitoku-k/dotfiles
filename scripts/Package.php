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

    public function symlink($name, $target = null)
    {
        $target = $target ?: "{$this->home}/{$name}";
        $realpath = realpath($name);

        if (file_exists($target)) {
            echo "File exists: {$name}\n";
            return;
        }

        if (!file_exists(dirname($target))) {
            mkdir(dirname($target), 0755, true);
        }

        symlink($realpath, $target);
    }

    public function cloneGit($repo, $target, $source = 'https://github.com/')
    {
        return passthru("git clone --depth 1 {$source}{$repo}.git {$target}");
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
        }
    }

    public function __invoke()
    {
        if (!$this->callback) {
            return $this->symlink($this->name);
        }
        $callback = $this->callback;
        return $callback($this);
    }
}
