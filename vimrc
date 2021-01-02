call plug#begin('$HOME/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'liuchengxu/vista.vim'

call plug#end()

syntax on

set autoindent
set cindent
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cmdheight=2
set updatetime=300

colorscheme codedark

let s:uname = "unknown"
if has("unix")
    let s:uname = system("uname -s")
endif

if s:uname == "Darwin\n"
    set backspace=indent,eol,start
    set clipboard=unnamed
elseif s:uname == "Linux\n"
    set clipboard=unnamedplus
endif

" coc.nvim configurations
set hidden

set shortmess+=c

if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] = ~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

set tagfunc=CocTagFunc

" vista.vim
let g:vista_default_executive = 'coc'

" vim-airline
let g:airline_theme = 'codedark'

filetype plugin indent on
