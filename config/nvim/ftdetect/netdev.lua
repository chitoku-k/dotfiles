vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.netdev' },
  callback = function()
    vim.opt_local.filetype = 'dosini'
  end,
})
