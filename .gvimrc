"-------------------
" 表示
"-------------------
runtime! userautoload/colors.vim
set lines=50
set columns=200

" GVim (GTK)
if has('gui_gtk2')
  set linespace=3
  set guifont=Inconsolata\ 11
endif

" MacVim
if has('gui_macvim')
  set transparency=3
  set linespace=5
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

" マウス無効化
set mouse=

" カーソル位置復元/メニュー無効化
augroup vimStartup
  autocmd!
  autocmd BufWinEnter * source $VIMRUNTIME/delmenu.vim
augroup END


"-------------------
" クリップボード
"-------------------
if has('gui') || has('xterm_clipboard')
  set clipboard=unnamedplus,unnamed
  inoremap <D-v> <C-r>*
endif
