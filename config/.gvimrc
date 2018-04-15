runtime! userautoload/colors.vim

set lines=50
set columns=200
set t_vb=
set guioptions=c
set mouse=

augroup vimStartup
  autocmd!
  autocmd BufWinEnter * source $VIMRUNTIME/delmenu.vim
augroup END
