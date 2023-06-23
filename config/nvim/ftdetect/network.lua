vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.network' },
  callback = function()
    vim.opt_local.filetype = 'dosini'
  end,
})
