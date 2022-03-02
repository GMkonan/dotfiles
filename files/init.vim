:set number
:set autoindent
:set mouse=a
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'

call plug#end()

// Key bindings to open nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
