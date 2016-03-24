"-------------------
" 表示
"-------------------
colorscheme base16-ocean            " カラースキーム
set lines=50                        " 行
set columns=140                     " 幅
set guifont=Ricty\ Regular:h14      " フォント


"-------------------
" マウス
"-------------------
set mouse=a


"-------------------
" クリップボード
"-------------------
if has('gui') || has('xterm_clipboard')
  set clipboard=unnamed
endif
