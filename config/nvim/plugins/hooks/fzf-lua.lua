-- lua_post_source {{{
require('fzf-lua').setup({
  fzf_opts = {
    ['--layout'] = 'reverse',
  },
})

vim.keymap.set('n', '<Space>g', function()
  require('fzf-lua').files({
    fzf_opts = {
      ['--tiebreak'] = 'index',
      ['--layout'] = 'reverse',
    },
  })
end)

vim.keymap.set('n', '<Space>f', function()
  require('fzf-lua').buffers()
end)

vim.keymap.set('n', '<Space>m', function()
  require('fzf-lua').marks()
end)
-- }}}
