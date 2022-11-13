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
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
call plug#end()

colorscheme gruvbox
