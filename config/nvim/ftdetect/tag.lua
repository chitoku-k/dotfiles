vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.tag' },
  callback = function()
    vim.opt_local.filetype = 'html'
  end,
})
