if !has('nvim')
    set runtimepath+=~/.config/vim,~/.config/vim/after
    set directory=~/.cache/vim/swap
    set backupdir=~/.cache/vim/backup
    set viminfo+='1000,n~/.cache/vim/viminfo
endif
runtime! userautoload/{dein,*}.vim
