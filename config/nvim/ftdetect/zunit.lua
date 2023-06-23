vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.zunit' },
  callback = function()
    vim.opt_local.filetype = 'zsh'
  end,
})
