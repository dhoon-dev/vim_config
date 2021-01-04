call plug#begin('$HOME/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'liuchengxu/vista.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

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
let g:coc_global_extensions = [
    \'coc-clangd',
    \'coc-pairs',
    \'coc-lists',
    \'coc-highlight',
    \'coc-pyright',
    \'coc-json'
    \]

set hidden

set shortmess+=c

if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nmap <leader>rn <Plug>(coc-rename)

set tagfunc=CocTagFunc

" vista.vim
let g:vista_default_executive = 'coc'

" vim-airline
let g:airline_theme = 'codedark'

"vim-lsp-cxx-highlight
let g:lsp_cxx_hl_use_text_props = 1

filetype plugin indent on
