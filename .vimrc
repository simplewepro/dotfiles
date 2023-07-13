"Tabulations
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

"Line numbers
set number
set relativenumber

"Keymaps
inoremap jk <Esc>

"Move lines
nnoremap <silent> <A-UP> :m .-2 <CR>==
nnoremap <silent> <A-DOWN> :m .+1 <CR>==

inoremap <silent> <C-S-UP> <Esc>:m .-2 <CR>==gi
inoremap <silent> <C-S-DOWN> <Esc>:m .+1 <CR>==gi

vnoremap <silent> <C-S-UP> :m '<-2<CR>gv=gv
vnoremap <silent> <C-S-DOWN> :m '>+1<CR>gv=gv

"Work with tabulations
nnoremap <silent> <Tab> >>_
nnoremap <silent> <C-S-Tab> <<_

inoremap <silent> <S-Tab> <C-D>

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"Plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

"NERDTree
let NERDTreeShowHidden=1
map <C-b> :NERDTreeToggle<CR>

