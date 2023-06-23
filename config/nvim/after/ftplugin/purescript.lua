vim.opt_local.commentstring = '-- %s'

local purescript_id = vim.api.nvim_create_augroup('purescript', {})
vim.api.nvim_create_autocmd('OptionSet', {
  group = purescript_id,
  callback = function()
    vim.g.purescript_indent_if = vim.o.shiftwidth
    vim.g.purescript_indent_case = vim.o.shiftwidth
    vim.g.purescript_indent_let = vim.o.shiftwidth
    vim.g.purescript_indent_where = vim.o.shiftwidth
    vim.g.purescript_indent_do = vim.o.shiftwidth
    vim.g.purescript_indent_in = vim.o.shiftwidth
  end,
})
