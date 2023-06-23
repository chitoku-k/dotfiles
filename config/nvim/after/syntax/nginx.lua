-- Disable vulnerability warning for gzip BREACH
-- See: https://github.com/chr4/nginx.vim/issues/8
vim.api.nvim_set_hl(0, 'ngxGzipOn', { link = 'NONE' })
