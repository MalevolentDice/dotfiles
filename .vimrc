set nocompatible
syntax enable
filetype plugin on
set path+=**
set wildmenu
command! MakeTags !ctags -R .

let g:netrw_banner=0
let g:netrw_altv=1

set number
set relativenumber
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

" nnoremap ,html :-1read $HOME/.vim/template.html<CR>3jwf>a
