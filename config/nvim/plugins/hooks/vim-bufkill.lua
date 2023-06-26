-- lua_post_source {{{
vim.api.nvim_create_user_command(
  'BDU',
  function()
    local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':p:h')
    vim.cmd.BD()
    vim.cmd.edit(dir)
  end,
  {}
)
vim.api.nvim_create_user_command(
  'WBD',
  function()
    vim.cmd.write()
    vim.cmd.BD()
  end,
  {}
)
vim.api.nvim_create_user_command(
  'WBDU',
  function()
    local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':p:h')
    vim.cmd.WBD()
    vim.cmd.edit(dir)
  end,
  {}
)
-- }}}
