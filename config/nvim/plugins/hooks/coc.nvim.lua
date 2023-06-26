-- lua_add {{{
vim.g.coc_default_semantic_highlight_groups = 1
vim.g.coc_global_extensions = {
  'coc-css',
  'coc-java',
  'coc-json',
  'coc-go',
  'coc-phpls',
  'coc-powershell',
  'coc-rust-analyzer',
  'coc-sh',
  'coc-snippets',
  'coc-styled-components',
  'coc-tsserver',
  'coc-vetur',
  'coc-yaml',
}
-- }}}

-- lua_post_source {{{
vim.keymap.set('i', '<C-x><C-n>', function()
  vim.fn['coc#refresh']()
end)
vim.keymap.set('n', '<F1>', function()
  vim.fn.CocAction('doHover')
end)
vim.keymap.set('n', '<F2>', '<Plug>(coc-rename)')
vim.keymap.set('n', '<F3>', '<Plug>(coc-implementation)')
vim.keymap.set('n', '<F4>', '<Plug>(coc-definition)')
vim.keymap.set('n', '<F5>', '<Plug>(coc-codeaction-cursor)')
vim.keymap.set('n', '<F6>', function()
  vim.cmd.CocDiagnostics()
end)
vim.keymap.set('n', '<F7>', function()
  vim.fn.CocAction('inspectSemanticToken')
end)

local coc_id = vim.api.nvim_create_augroup('coc', {})
vim.api.nvim_create_autocmd('User', {
  group = coc_id,
  pattern = { 'CocDiagnosticChange' },
  callback = function()
    require('lualine').refresh()
  end,
})
vim.api.nvim_create_autocmd('User', {
  group = coc_id,
  pattern = { 'CocOpenFloatPrompt' },
  callback = function()
    vim.api.nvim_create_autocmd('InsertLeave', {
      buffer = vim.fn.winbufnr(vim.g.coc_last_float_win),
      callback = function()
        vim.opt.backspace = ''
      end,
    })
    vim.opt.backspace = 'indent,eol,start'
  end,
})
vim.api.nvim_create_autocmd('CursorHoldI', {
  group = coc_id,
  callback = function()
    vim.fn.CocActionAsync('highlight')
  end,
})
-- }}}
