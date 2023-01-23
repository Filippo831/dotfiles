" --------- Vim configuration ----------
syntax on
set number relativenumber

" Indentation
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

set noshowmode
set cursorline
set noerrorbells
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set undodir=~/.config/nvim/.vim/undodir
set undofile
set scrolloff=8
set ttimeoutlen=0
set updatetime=200
set encoding=UTF-8
set iskeyword-=_

set signcolumn=yes
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=grey
set cmdheight=1

set clipboard=unnamedplus
