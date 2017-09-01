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
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" インクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" 行末まで選択
vnoremap v $h
vnoremap e joko

" 無効化
nnoremap <F1> <Nop>
inoremap <F1> <Nop>
nnoremap <Left> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>
nnoremap <Right> <Nop>
vnoremap <Left> <Nop>
vnoremap <Down> <Nop>
vnoremap <Up> <Nop>
vnoremap <Right> <Nop>
cnoremap <Left> <Nop>
cnoremap <Down> <Nop>
cnoremap <Up> <Nop>
cnoremap <Right> <Nop>
if !has('gui')
  inoremap <Left> <Nop>
  inoremap <Down> <Nop>
  inoremap <Up> <Nop>
  inoremap <Right> <Nop>
endif

" Neovim
if has('nvim')
  nnoremap <silent> <Space>s :sp \| terminal<CR>
  nnoremap <silent> <Space>t :tabnew \| terminal<CR>
  tnoremap <C-q> <C-\><C-n>
endif

" 貼り付け
set pastetoggle=<C-p>
