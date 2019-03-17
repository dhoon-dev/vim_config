call plug#begin('$HOME/.vim/plugged')

Plug 'tpope/vim-pathogen'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'

call plug#end()

execute pathogen#infect()

syntax on

set noshowmode
set autoindent
set cindent
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set mouse=a
set clipboard=unnamed
highlight Comment ctermfg=blue

inoremap <expr><tab> pumvisible()?"\<c-n>":"\<tab>"
inoremap <expr><s-tab> pumvisible()?"\<c-p>":"\<c-d>"

let g:airline#extensions#ale#enabled = 1
let g:ale_virtualtext_cursor = 1
let g:ale_linters = { 'cpp' : ['cquery'] }
let g:ale_completion_enabled = 1
let g:ale_c_parse_makefile = 1
let g:ale_c_parse_compile_commands = 1
packloadall
silent! helptags ALL
