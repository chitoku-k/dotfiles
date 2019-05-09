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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" インクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>
vnoremap + g<C-a>
vnoremap - g<C-x>

" 行末まで選択
vnoremap v $h
vnoremap e joko

" 無効化
nnoremap <C-q> <Nop>
nnoremap <F1> <Nop>
inoremap <F1> <Nop>
inoremap <F2> <Nop>
inoremap <F3> <Nop>
inoremap <F4> <Nop>
inoremap <F6> <Nop>
inoremap <F7> <Nop>
inoremap <F8> <Nop>
inoremap <F9> <Nop>
inoremap <F10> <Nop>
inoremap <F11> <Nop>
inoremap <F12> <Nop>
inoremap <F13> <Nop>
inoremap <F14> <Nop>
inoremap <F15> <Nop>
inoremap <F16> <Nop>
inoremap <F17> <Nop>
inoremap <F18> <Nop>
inoremap <F19> <Nop>
inoremap <F20> <Nop>
inoremap <F21> <Nop>
inoremap <F22> <Nop>
inoremap <F23> <Nop>
inoremap <F24> <Nop>
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

" 日付
inoremap <silent> <F5> <C-R>=substitute(strftime('%FT%T%z'), '+\(\d\d\)\(\d\d\)$', '+\1:\2', '')<CR>

" 貼り付け
set pastetoggle=<C-p>
