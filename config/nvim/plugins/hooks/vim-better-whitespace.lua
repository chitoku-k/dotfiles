-- lua_add {{{
vim.g.better_whitespace_guicolor = vim.g.base16_gui08
-- }}}

-- lua_post_source {{{
local filetypes_blacklist = vim.g.better_whitespace_filetypes_blacklist
table.insert(filetypes_blacklist, 'liquid')
vim.g.better_whitespace_filetypes_blacklist = filetypes_blacklist
-- }}}
