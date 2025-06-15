call plug#begin()
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'folke/trouble.nvim'
Plug 'savq/melange-nvim'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} 
Plug 'xiyaowong/transparent.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'mikavilpas/yazi.nvim'


Plug 'nvim-neotest/nvim-nio'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
call plug#end()


source ~/.config/nvim/lua/setupstuff.lua

augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.lus,*.c,*.cpp,*.md undojoin | Neoformat
augroup END



source ~/.config/nvim/lua/u_lspsettings.lua
source ~/.config/nvim/keybinds.vim
source  ~/.config/nvim/settings.vim
source ~/.config/nvim/neoformat.vim
filetype plugin indent on
syntax on
