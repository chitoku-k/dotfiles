"-------------------
" 表示
"-------------------
set background=dark                 " 背景色
set transparency=6                  " 透明度
set lines=50                        " 行
set columns=160                     " 幅
set guifont=Ricty\ Regular:h12      " フォント
set linespace=2                     " 行間


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
