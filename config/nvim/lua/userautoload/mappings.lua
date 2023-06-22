local utils = require('utils')

vim.api.nvim_set_keymap('c', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-k>', '<Up>', { noremap = true })

vim.api.nvim_set_keymap('v', 'v', '$h', { noremap = true })

vim.api.nvim_set_keymap('n', '<Space>s', ':split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>v', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>t', ':tabnew | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-n>', { noremap = true })

vim.api.nvim_set_keymap('i', '<C-Space>', '<Nop>', { noremap = true })

for i = 1, 24 do
  vim.api.nvim_set_keymap('i', '<F' .. i .. '>', '<Nop>', { noremap = true })
end

for _, mode in ipairs({ 'n', 'v', 'c' }) do
  for _, key in ipairs({ '<Left>', '<Down>', '<Up>', '<Right>' }) do
    vim.api.nvim_set_keymap(mode, key, '<Nop>', { noremap = true })
  end
end

vim.api.nvim_create_augroup('term', {})
vim.api.nvim_create_autocmd('TermOpen', {
  group = 'term',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.signcolumn = 'no'
    vim.cmd.startinsert()

    if vim.g.loaded_better_whitespace_plugin == 1 then
      vim.api.nvim_command('DisableWhitespace')
    end

    if vim.g.loaded_hexokinase == 1 then
      vim.fn['hexokinase#v2#scraper#off']()
    end
  end,
})

if not utils.supports_cursor then
  vim.opt.guicursor = ''
end
