vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '.eslintrc' },
  callback = function()
    vim.opt_local.filetype = 'json'
  end,
})
