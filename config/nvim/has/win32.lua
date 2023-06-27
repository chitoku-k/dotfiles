vim.opt.linespace = 4
vim.opt.guifont = 'Consolas:h10'
vim.opt.guifontwide = 'Meiryo:h10,MS_Gothic:h10'

if vim.fn.executable('pwsh') == 1 then
  vim.opt.shell = 'pwsh -NoLogo'
  vim.opt.shellcmdflag = '-NoProfile -NoLogo -NonInteractive -Command'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
end
