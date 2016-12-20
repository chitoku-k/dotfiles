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

    public function symlink($names)
    {
        if (!is_array($names) && !$names instanceof Traversable) {
            return $this->symlink((array)$names);
        }
        foreach ($names as $name) {
            $target = "{$_SERVER['HOME']}/{$name}";
            $realpath = realpath($name);

            if (file_exists($target)) {
                echo "File exists: {$name}\n";
                continue;
            }

            symlink($realpath, $target);
        }
    }

    public function __invoke()
    {
        if (!$this->callback) {
            return $this->symlink((array)$this->name);
        }
        $callback = $this->callback;
        return $callback($this);
    }
}
