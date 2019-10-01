inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

nnoremap + <C-a>
nnoremap - <C-x>
vnoremap + g<C-a>
vnoremap - g<C-x>

vnoremap v $h
vnoremap e joko

nnoremap <C-q> <Nop>
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

inoremap <silent> <F5> <C-R>=substitute(strftime('%FT%T%z'), '+\(\d\d\)\(\d\d\)$', '+\1:\2', '')<CR>
