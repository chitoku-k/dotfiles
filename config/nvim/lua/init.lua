local utils = require('utils')
local dein_dir = utils.repo_dir('/Shougo/dein.vim')

if vim.fn.isdirectory(dein_dir) == 1 then
  vim.opt.runtimepath:append(dein_dir)

  if vim.fn['dein#load_state'](utils.plugin_dir()) == 1 then
    vim.fn['dein#begin'](utils.plugin_dir())

    for _, file in ipairs(vim.fn.glob(utils.config_dir('/plugins/**/*.toml'), 1, 1)) do
      vim.fn['dein#load_toml'](file)
    end

    if vim.fn['dein#check_install']() == 1 then
      vim.fn['dein#install']()
    end

    vim.fn['dein#end']()
    vim.fn['dein#save_state']()
  end

  vim.cmd('runtime! lua/userautoload/*.lua')

  for _, file in ipairs(vim.fn.glob(utils.config_dir('/lua/has/*.lua'), 1, 1)) do
    local feature = vim.fn.fnamemodify(file, ':t:r')
    if vim.fn.has(feature) == 1 then
      vim.cmd.source(file)
    end
  end
end
