" 対応括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" カーソル移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" ウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" テキスト移動
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-l> <Plug>(textmanip-move-right)
nmap <CR> <Plug>(textmanip-blank-below) jj

" インクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" 検索結果表示位置
nnoremap n nzz
nnoremap N Nzz

" ハイライト非表示
nmap <silent> <ESC><ESC> :nohlsearch<CR>

" 行末まで選択
vnoremap v $h

" 無効化
nnoremap q <Nop>
nnoremap <F1> <Nop>

" 貼り付け
set pastetoggle=<C-p>
