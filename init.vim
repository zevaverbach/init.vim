set number relativenumber
set signcolumn=yes


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

set hidden
set undofile
" set a directory to store the undo history
" TODO: when setting up a new environment, create this dir
set undodir=/home/zev/.vimundo/

let mapleader=" "
noremap <c-s> :w<cr>
nnoremap <silent> <leader>v :e ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>w :bw<cr>
nnoremap <silent> <leader>q :bw<cr>:q<cr>
nnoremap <silent> <leader>i :PlugInstall<cr>
nnoremap <silent> <leader>r :so ~/.config/nvim/init.vim<cr>
nnoremap <silent> <c-h> :bp<cr>
nnoremap <silent> <c-l> :bn<cr>
nnoremap <silent> <leader>f :Telescope find_files<cr>
nnoremap <silent> <leader>g :Telescope live_grep<cr>
nnoremap <silent> <leader>b :Telescope buffers<cr>
nnoremap <silent> <C-c> :noh<cr>
nnoremap de dg$
nnoremap <c-d> dd
nnoremap <c-y> yy
noremap <C-S-y> v0yO<ESC>pjly$kgp`[j
noremap v V
noremap V v

" Helix-style bindings, I missed 'em!
nnoremap gs 0
nnoremap gl $
nnoremap ge G
nnoremap 0 <NOP>
nnoremap G <NOP>
nnoremap $ <NOP>
nnoremap U <C-r>
nnoremap <C-r> <NOP>
" /Helix bindings
"
" COC bindings
"
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=200

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>k :call ShowDocumentation()<CR>

augroup mygroup
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nnoremap <leader>rn <Plug>(coc-rename)


call plug#begin()
  Plug 'Exafunction/codeium.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'meain/vim-printer'
  Plug 'tpope/vim-commentary'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} 
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

let g:python3_host_prog="/usr/bin/python3"

colorscheme tokyonight-storm
