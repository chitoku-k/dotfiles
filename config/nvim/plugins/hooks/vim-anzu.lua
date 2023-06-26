-- lua_add {{{
vim.g.anzu_status_format = '%/ (%i/%l)'
-- }}}

-- lua_post_source {{{
vim.keymap.set('n', '<Esc><Esc>', '<Plug>(anzu-clear-search-status):nohlsearch<CR>')
vim.keymap.set('n', '*', '<Plug>(asterisk-*)<Plug>(anzu-update-search-status-with-echo)')
vim.keymap.set('n', '#', '<Plug>(asterisk-#)<Plug>(anzu-update-search-status-with-echo)')

local anzu_id = vim.api.nvim_create_augroup('anzu', {})
vim.api.nvim_create_autocmd({ 'WinLeave', 'TabLeave' }, {
  group = anzu_id,
  callback = function()
    vim.fn['anzu#clear_search_status']()
  end,
})
-- }}}
