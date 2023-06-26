local function plugin_dir(...)
  return vim.fn.fnamemodify(vim.fn.stdpath('data'), ':h') .. '/dein' .. table.concat({ ... })
end

local function config_dir(...)
  return vim.fn.expand('<sfile>:p:h') .. table.concat({ ... })
end

local dein_dir = plugin_dir('/repos/github.com/Shougo/dein.vim')

if vim.fn.isdirectory(dein_dir) == 1 then
  vim.opt.runtimepath:append(dein_dir)

  local dein = require('dein')
  if dein.load_state(plugin_dir()) == 1 then
    dein.begin(plugin_dir())

    vim.env.HOOKS_DIR = config_dir('/plugins/hooks')
    for _, file in ipairs(vim.fn.glob(config_dir('/plugins/**/*.toml'), 1, 1)) do
      dein.load_toml(file)
    end

    if dein.check_install() then
      dein.install()
    end

    dein.end_()
    dein.save_state()
  end

  vim.cmd.runtime({ 'userautoload/*.lua', bang = true })

  for _, file in ipairs(vim.fn.glob(config_dir('/has/*.lua'), 1, 1)) do
    local feature = vim.fn.fnamemodify(file, ':t:r')
    if vim.fn.has(feature) == 1 then
      vim.cmd.source(file)
    end
  end
end
