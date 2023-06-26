-- lua_post_source {{{
vim.cmd.SpeedDatingFormat('%Y/%m/%d')
vim.cmd.SpeedDatingFormat('%Y年%m月%d日')

vim.keymap.set('n', '<Plug>SpeedDatingFallbackUp', '<Plug>(increment-activator-increment)')
vim.keymap.set('n', '<Plug>SpeedDatingFallbackDown', '<Plug>(increment-activator-decrement)')
-- }}}
