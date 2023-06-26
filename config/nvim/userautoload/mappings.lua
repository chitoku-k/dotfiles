local utils = require('utils')

vim.keymap.set('c', '<C-j>', '<Down>')
vim.keymap.set('c', '<C-k>', '<Up>')

vim.keymap.set('v', 'v', '$h')

vim.keymap.set('n', '<Space>s', function()
  vim.cmd.split()
  vim.cmd.terminal()
end)
vim.keymap.set('n', '<Space>v', function()
  vim.cmd.vsplit()
  vim.cmd.terminal()
end)
vim.keymap.set('n', '<Space>t', function()
  vim.cmd.tabopen()
  vim.cmd.terminal()
end)
vim.keymap.set('n', '<Esc><Esc>', function()
  vim.cmd.nohlsearch()
end)
vim.keymap.set('n', '<C-q>', '<Nop>')
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>')

vim.keymap.set('i', '<C-Space>', '<Nop>')

for i = 1, 24 do
  vim.keymap.set('i', '<F' .. i .. '>', '<Nop>')
end

for _, key in ipairs({ '<Left>', '<Down>', '<Up>', '<Right>' }) do
  vim.keymap.set({ 'n', 'v', 'c', 'i' }, key, '<Nop>')
end

local term_id = vim.api.nvim_create_augroup('term', {})
vim.api.nvim_create_autocmd('TermOpen', {
  group = term_id,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.signcolumn = 'no'
    vim.cmd.startinsert()

    if vim.g.loaded_better_whitespace_plugin == 1 then
      vim.cmd.DisableWhitespace()
    end

    if vim.g.loaded_hexokinase == 1 then
      vim.fn['hexokinase#v2#scraper#off']()
    end
  end,
})

if not utils.supports_cursor() then
  vim.opt.guicursor = ''
end
