<?php
// vim:set ft=php:
$finder = PhpCsFixer\Finder::create()->exclude('vendor')->in(__DIR__);
$rules = [
    '@Symfony' => true,
    'blank_line_after_opening_tag' => false,
    'cast_spaces' => [
        'space' => 'none',
    ],
    'combine_consecutive_issets' => true,
    'concat_space' => [
        'spacing' => 'one',
    ],
    'dir_constant' => true,
    'encoding' => false,
    'linebreak_after_opening_tag' => true,
    'modernize_types_casting' => true,
    'no_alias_functions' => true,
    'no_php4_constructor' => true,
    'no_useless_else' => true,
    'no_useless_return' => true,
    'not_operator_with_space' => false,
    'not_operator_with_successor_space' => false,
    'phpdoc_to_comment' => false,
    'phpdoc_types' => false,
    'protected_to_private' => false,
    'self_accessor' => false,
    'single_blank_line_before_namespace' => false,
    'single_line_comment_style' => true,
    'yoda_style' => false,
];

return PhpCsFixer\Config::create()
    ->setRiskyAllowed(true)
    ->setFinder($finder)
    ->setRules($rules);
