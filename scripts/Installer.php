<?php

class Installer
{
    /** @var Console */
    protected $console;

    /** @var Package[] */
    protected $packages;

    public function __construct(Console $console, array $packages)
    {
        $this->console = $console;
        $this->packages = $packages;
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
            $this->console->printMessage($index + 1, false, 5);
            $this->console->printMessage(" {$package->category}", true, $package->category_color);
            $this->console->printMessage('/');
            $this->console->printMessage("{$package->name}\n", true);
            $this->console->printMessage("    {$package->description}\n");
        }

        $this->console->printArrow(true, 2);
        $this->console->printMessage("Packages to install (eg: 1 2 3 or 1-3)\n", true, 2);

        $this->console->printArrow(true, 2);

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
