syntax enable
filetype plugin indent on
set number
set wrap
set signcolumn=yes
set undofile
set undodir=~/.vim/undodir
set completeopt+=menuone,noselect
set termguicolors
set incsearch
set nohlsearch
set updatetime=50
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noswapfile
set cindent
set clipboard+=unnamedplus
set foldmethod=indent
set nofoldenable
set background=dark
colorscheme melange

highlight NormalNC guibg=NONE ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE

"highlight Comment guibg=NONE ctermbg=NONE
highlight Hints guibg=NONE ctermbg=NONE
highlight Info guibg=NONE ctermbg=NONE

" Terminal settings
augroup TerminalSetup
	autocmd!
	autocmd TermOpen * setlocal nonumber norelativenumber
autocmd TermOpen * startinsert
	autocmd TermOpen * setlocal signcolumn=no
augroup END

let g:javascript_plugin_jsdoc = 1
let g:typescript_ignore_browserwords = 1
let g:coc_default_semantic_highlight_groups = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_run_all_formatters = 1
let g:yats_host_keyword = 1

vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

