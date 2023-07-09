-- lua_post_source {{{
vim.api.nvim_create_user_command(
  'BDU',
  function(arg)
    local bufnr = vim.fn.bufnr()
    local dir = vim.fn.expand('%:p:h')
    vim.cmd.BD({ bang = arg.bang })

    if vim.fn.bufloaded(bufnr) == 0 then
      vim.cmd.edit(dir)
    end
  end,
  { bang = true }
)
vim.api.nvim_create_user_command(
  'WBD',
  function(arg)
    vim.cmd.write()
    vim.cmd.BD({ bang = arg.bang })
  end,
  { bang = true }
)
vim.api.nvim_create_user_command(
  'WBDU',
  function(arg)
    local bufnr = vim.fn.bufnr()
    local dir = vim.fn.expand('%:p:h')
    vim.cmd.WBD({ bang = arg.bang })

    if vim.fn.bufloaded(bufnr) == 0 then
      vim.cmd.edit(dir)
    end
  end,
  { bang = true }
)
-- }}}
