vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*/.kube/config', '*/.bp/config*' },
  callback = function()
    vim.opt_local.filetype = 'yaml'
  end,
})
