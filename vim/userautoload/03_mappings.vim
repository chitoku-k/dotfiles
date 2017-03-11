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

" カーソル移動抑制
if !has('nvim') && !has('gui')
  nnoremap <Left>  :<C-u>!sl<CR><CR>
  nnoremap <Down>  :<C-u>!sl<CR><CR>
  nnoremap <Up>    :<C-u>!sl<CR><CR>
  nnoremap <Right> :<C-u>!sl<CR><CR>
  vnoremap <Left>  :<C-u>!sl<CR><CR>
  vnoremap <Down>  :<C-u>!sl<CR><CR>
  vnoremap <Up>    :<C-u>!sl<CR><CR>
  vnoremap <Right> :<C-u>!sl<CR><CR>
  inoremap <Left>  <Esc>:<C-u>!sl<CR><CR>
  inoremap <Down>  <Esc>:<C-u>!sl<CR><CR>
  inoremap <Up>    <Esc>:<C-u>!sl<CR><CR>
  inoremap <Right> <Esc>:<C-u>!sl<CR><CR>
endif

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

" Neovim (C-h)
" https://github.com/neovim/neovim/issues/2048
if has('nvim')
  nmap <BS> <C-w>h
endif
