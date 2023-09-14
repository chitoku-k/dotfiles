pcall(vim.cmd.language, 'en_US.UTF-8')

vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = { 'ucs-bom', 'utf-8', 'euc-jp', 'cp932', 'sjis' }
vim.opt.hidden = true
vim.opt.showmode = false
vim.opt.undofile = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.ttimeoutlen = 100
vim.opt.updatetime = 300
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.virtualedit = 'block'
vim.opt.cindent = true
vim.opt.title = true
vim.opt.titleold = ''
vim.opt.mouse = ''
vim.opt.whichwrap = ''
vim.opt.backspace = ''
vim.opt.viminfo = ''

vim.opt.list = true
vim.opt.visualbell = false
vim.opt.foldenable = false
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.showtabline = 2
vim.opt.laststatus = 2
vim.opt.ambiwidth = 'single'
vim.opt.wrap = false
vim.opt.lazyredraw = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false
vim.opt.shortmess:append('cs')
vim.opt.completeopt = 'menu'
vim.opt.pumheight = 20
vim.opt.previewheight = 5
vim.opt.signcolumn = 'yes'
vim.opt.diffopt:append({ 'context:3', 'vertical', 'indent-heuristic' })
vim.opt.listchars = 'tab:▸ '
vim.opt.fillchars:append({ vert = ' ', diff = ' ', eob = ' ' })

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.inccommand = 'split'

if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = 'rg --vimgrep --no-heading'
  vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end

local init_id = vim.api.nvim_create_augroup('init', {})
vim.api.nvim_create_autocmd('BufEnter', {
  group = init_id,
  callback = function()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  group = init_id,
  pattern = { '[^l]*' },
  callback = function()
    vim.cmd.cwindow()
  end,
})
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  group = init_id,
  pattern = { 'l*' },
  callback = function()
    vim.cmd.lwindow()
  end,
})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = init_id,
  callback = function()
    pcall(function()
      vim.highlight.on_yank({
        higroup = 'Flashy',
        timeout = 100,
      })
    end)
  end,
})
