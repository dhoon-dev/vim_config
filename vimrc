call plug#begin('$HOME/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'

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

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-refernces)

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

" vim-airline
let g:airline_theme = 'codedark'

filetype plugin indent on
