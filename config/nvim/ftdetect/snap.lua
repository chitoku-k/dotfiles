vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.js.snap' },
  callback = function()
    vim.opt_local.filetype = 'javascript'
  end,
})
