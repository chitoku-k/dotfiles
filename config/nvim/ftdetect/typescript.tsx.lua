vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.tsx' },
  callback = function()
    vim.opt_local.filetype = 'typescript.tsx'
  end,
})
