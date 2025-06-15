noremap <Space> <Nop>
let mapleader=' '

nnoremap <S-L> :wincmd l<CR>
nnoremap <S-H> :wincmd h<CR>
nnoremap <S-J> :wincmd j<CR>
nnoremap <S-K> :wincmd k<CR>
nnoremap <A-Tab> :tabnext<CR>
nnoremap <A-S-Tab> :tabprev<CR>
nnoremap <C-S-M> :tabnew<CR>

function! ToggleMouse()
  if &mouse == ''
    set mouse=a
  else
    set mouse=
  endif
endfunction

nnoremap <leader>mt :call ToggleMouse()<CR>

nnoremap gd :lua vim.lsp.buf.definition()<CR>

nnoremap <silent><C-.> :vertical resize +10<CR>
nnoremap <silent><C-,> :vertical resize -10<CR>
nnoremap <silent><leader>v :vsplit<CR>
nmap <S-f> <Plug>(easymotion-prefix)
nmap <leader>i :Man<CR>

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
" -1 for jumping backwards.

smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>o <cmd>Telescope buffers<CR>

nnoremap <S-d> <cmd>:Yazi <CR>
"imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
"inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
"imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
inoremap <C-c> <Esc>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <leader>hr :resize +
nnoremap <leader>wr :vertical resize +
nnoremap <leader>e g_
nnoremap <leader>d <cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>
nnoremap <leader>y "+y


nnoremap <F3> :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>

tnoremap <C-z> <C-\><C-n>


nnoremap <silent><C-J> :normal! L <CR>
nnoremap <silent><C-K> :normal! H <CR>

