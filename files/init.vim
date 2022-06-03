:set number
:set autoindent
:set mouse=a
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
" highlight matching parens, braces, brackets, etc
:set showmatch

call plug#begin()

" To install plugins just paste here "Plug <github url of the plugin's repo"
" After that run :PlugInstall on vim
" If you want to delete a plugin, remove the line in here and run the command :PlugClean

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/fsouza/prettierd'
" Plug 'https://github.com/rking/ag.vim'
Plug 'https://github.com/jeetsukumaran/vim-buffergator'

call plug#end()

" Key bindings to open nerdtree (<C-t> = ctrl + t)
nnoremap <C-t> :NERDTreeToggle<CR>
