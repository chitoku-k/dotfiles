-- Copied from the following and converted to Lua:
-- (1) “How to get group name of highlighting under cursor in vim?”
-- See: https://stackoverflow.com/a/37040415
-- (2) “`synstack()` equivalent for extmarks-based highlighting?”
-- See: https://neovim.discourse.group/t/synstack-equivalent-for-extmarks-based-highlighting/1373
function SynGroup()
  local hl_groups = {}
  local row = vim.fn.line('.')
  local col = vim.fn.col('.')

  local s = vim.fn.synID(row, col, 1)
  if s ~= 0 then
    table.insert(hl_groups, vim.fn.synIDattr(s, 'name') .. ' -> ' .. vim.fn.synIDattr(vim.fn.synIDtrans(s), 'name'))
  end

  if vim.fn.exists('*nvim_buf_get_extmarks') == 1 then
    local namespaces = vim.api.nvim_get_namespaces()
    for _, ns_id in ipairs(vim.tbl_values(namespaces)) do
      local extmarks = vim.api.nvim_buf_get_extmarks(0, ns_id, { row - 1, col - 1 }, { row - 1, col - 1 }, { details = true })
      for _, extmark in ipairs(extmarks) do
        table.insert(hl_groups, extmark[3].hl_group)
      end
    end
  end

  return hl_groups
end
