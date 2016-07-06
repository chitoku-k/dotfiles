"-------------------
" 表示
"-------------------
set background=dark                 " 背景色
set transparency=6                  " 透明度
set lines=50                        " 行
set columns=160                     " 幅
set guifont=Inconsolata:h13         " フォント (半角)
set guifontwide=HiraginoSans-W2     " フォント (全角)
set linespace=3                     " 行間
set guioptions-=L                   " 左スクロールバー非表示
set guioptions-=r                   " 右スクロールバー非表示


"-------------------
" クリップボード
"-------------------
if has('gui') || has('xterm_clipboard')
  set clipboard=unnamed
endif
