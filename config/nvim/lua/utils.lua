local M = {}
local root_dir = vim.fn.expand('<sfile>:p:h')

function M.plugin_dir(...)
  if vim.fn.has('win32') == 1 then
    return vim.env.APPDATA .. '\\dein' .. table.concat({ ... })
  else
    return vim.env.XDG_DATA_HOME .. '/dein' .. table.concat({ ... })
  end
end

function M.data_dir(...)
  if vim.fn.has('win32') == 1 then
    return vim.env.APPDATA .. '\\vim' .. table.concat({ ... })
  else
    return vim.env.XDG_DATA_HOME .. '/vim' .. table.concat({ ... })
  end
end

function M.config_dir(...)
  return root_dir .. table.concat({ ... })
end

function M.repo_dir(...)
  return M.plugin_dir('/repos/github.com') .. table.concat({ ... })
end

function M.supports_cursor()
  return vim.env.TERM_PROGRAM and vim.env.TERM_PROGRAM:match('iTerm\\.app|Apple_Terminal')
    or vim.env.VTE_VERSION and tonumber(vim.env.VTE_VERSION) >= 3900
    or vim.env.WT_SESSION ~= ''
end

return M
