local M = {}
local root_dir = vim.fn.expand('<sfile>:p:h')

function M.plugin_dir(...)
  if vim.fn.has('win32') == 1 then
    return vim.fs.joinpath(vim.env.APPDATA, 'dein', ...)
  else
    return vim.fs.joinpath(vim.env.XDG_DATA_HOME, 'dein', ...)
  end
end

function M.data_dir(...)
  if vim.fn.has('win32') == 1 then
    return vim.fs.joinpath(vim.env.APPDATA, 'vim', ...)
  else
    return vim.fs.joinpath(vim.env.XDG_DATA_HOME, 'vim', ...)
  end
end

function M.config_dir(...)
  return vim.fs.joinpath(root_dir, ...)
end

function M.repo_dir(...)
  return vim.fs.joinpath(M.plugin_dir('/repos/github.com'), ...)
end

function M.supports_cursor()
  return vim.env.TERM_PROGRAM:match('iTerm\\.app|Apple_Terminal')
    or tonumber(vim.env.VTE_VERSION) >= 3900
    or vim.env.WT_SESSION ~= ''
end

return M
