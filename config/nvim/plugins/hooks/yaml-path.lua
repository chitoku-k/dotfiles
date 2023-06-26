-- lua_post_source {{{
local yamlpath_id = vim.api.nvim_create_augroup('yamlpath', {})
vim.api.nvim_create_autocmd('FileType', {
  group = yamlpath_id,
  pattern = { 'yaml' },
  callback = function()
    vim.keymap.set('n', '<F4>', function()
      vim.cmd.Yamlpath()
    end, { buffer = true })
  end,
})
-- }}}
