vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { 'monit' },
  callback = function()
    vim.opt_local.filetype = 'monitrc'
  end,
})
