"-------------------
" 表示
"-------------------
set background=dark
set transparency=3
set lines=50
set columns=200
set guifont=Inconsolata:h11
set guifontwide=HiraginoSans-W3
set linespace=3

" 左スクロールバー非表示
set guioptions-=L

" 右スクロールバー非表示
set guioptions-=r

" タブバー非表示
set guioptions-=e

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
