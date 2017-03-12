"-------------------
" 表示
"-------------------
set background=dark
set lines=50
set columns=200
set linespace=3

if has('gui_gtk2')
  set guifont=Inconsolata\ 8
elseif has('gui_macvim')
  set transparency=3
  set guifont=Inconsolata:h11
  set guifontwide=HiraginoSans-W3
endif

" 左スクロールバー非表示
set guioptions-=L

" 右スクロールバー非表示
set guioptions-=r

" タブバー非表示
set guioptions-=e

" メニューバー非表示
set guioptions-=m

" ツールバー非表示
set guioptions-=T

" ベル無効化
set t_vb=

" カーソル位置復元無効化
augroup vimStartup | au! | augroup END

" メニュー項目非表示
augroup gvimrc
  autocmd!
  autocmd BufWinEnter * source $VIMRUNTIME/delmenu.vim
augroup END


"-------------------
" クリップボード
"-------------------
if has('gui') || has('xterm_clipboard')
  set clipboard=unnamed
endif
