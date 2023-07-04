vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
})

vim.fn.sign_define({
  {
    name = 'DiagnosticSignError',
    text = '✖',
    texthl = 'DiagnosticSignError',
    numhl = 'DiagnosticSignError',
  },
  {
    name = 'DiagnosticSignWarn',
    text = '⚠',
    texthl = 'DiagnosticSignWarn',
    numhl = 'DiagnosticSignWarn',
  },
  {
    name = 'DiagnosticSignInfo',
    text = '⚑',
    texthl = 'DiagnosticSignInfo',
    numhl = 'DiagnosticSignInfo',
  },
})
