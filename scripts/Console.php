<?php
class Console
{
    public function getEscapeSequence($codes)
    {
        // Windows Command Prompt
        if (DIRECTORY_SEPARATOR === '\\') {
            return '';
        }

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
