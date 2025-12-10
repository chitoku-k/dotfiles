-- lua_post_source {{{
local filetypes_blacklist = {'liquid'}
for _, filetype in ipairs(vim.g.better_whitespace_filetypes_blacklist) do
  if filetype ~= 'markdown' then
    table.insert(filetypes_blacklist, filetype)
  end
end
vim.g.better_whitespace_filetypes_blacklist = filetypes_blacklist
-- }}}
