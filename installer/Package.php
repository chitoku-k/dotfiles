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
        $target = $target ?: "{$_SERVER['HOME']}/{$name}";
        $realpath = realpath($name);

        if (file_exists($target)) {
            echo "File exists: {$name}\n";
            return;
        }

        symlink($realpath, $target);
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
