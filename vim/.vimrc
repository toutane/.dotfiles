syntax on

set background=dark
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set cindent
set number
set relativenumber
set clipboard=unnamed
nnoremap <Leader>cc :set colorcolumn=80<cr>
nnoremap <Leader>ncc :set colorcolumn-=80<cr>

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'w0rp/ale'

call plug#end()


" Define ALE fixers
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier']
 \ }
 
" Fex ALE after a save
let g:ale_fix_on_save = 1

" Set the signcolumn in the number column
set signcolumn=number

colorscheme gruvbox

"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" use <tab> to trigger completion and navigate to the next complete item
"function! CheckBackspace() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"inoremap <silent><expr> <Tab>
"			\ coc#pum#visible() ? coc#pum#next(1) :
"			\ CheckBackspace() ? "\<Tab>" :
"			\ coc#refresh()

"let g:vimtex_view_general_viewer = 'open'
"let g:vimtex_view_general_options = '-a Skim'
