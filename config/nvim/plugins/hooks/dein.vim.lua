-- lua_add {{{
vim.g['dein#install_github_api_token'] = vim.env.DEIN_INSTALL_GITHUB_API_TOKEN

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require('dein').call_hook('post_source')
  end,
})
-- }}}
