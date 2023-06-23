vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*/jobs/*/bin/*' },
  callback = function()
    vim.opt_local.filetype = 'eruby.sh'
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*/jobs/*/templates/*.yml' },
  callback = function()
    vim.opt_local.filetype = 'eruby.yaml'
  end,
})
