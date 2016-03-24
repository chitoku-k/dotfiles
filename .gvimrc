"-------------------
" 表示
"-------------------
colorscheme base16-ocean            " カラースキーム
set lines=50                        " 行
set columns=140                     " 幅


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
