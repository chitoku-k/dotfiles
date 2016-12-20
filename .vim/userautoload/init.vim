if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'felixjung/vim-base16-lightline'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'nicklasos/vim-jsx-riot'
Plug 'StanAngeloff/php.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'itchyny/lightline.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 't9md/vim-textmanip'
Plug 'gko/vim-coloresque'
Plug 'sudo.vim'
Plug 'simeji/winresizer'

call plug#end()
filetype plugin indent on

source $VIMRUNTIME/macros/matchit.vim
