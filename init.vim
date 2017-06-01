call plug#begin('~/.vim/plugged')
"   completion/coding
    Plug 'Valloric/YouCompleteMe'
    Plug 'jiangmiao/auto-pairs' "自动括号匹配
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/vim-easy-align'
"   looking
    Plug 'altercation/vim-colors-solarized'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
"   utils
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'kassio/neoterm'
    Plug 'scrooloose/nerdtree'
    Plug 'mattn/emmet-vim'
call plug#end()

" fundamental settings
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac
filetype on
filetype plugin on
filetype plugin indent on
syntax on

" some useful settings
set smartindent
set expandtab       " tab to spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4
set foldenable
set foldmethod=manual
set ignorecase
set smartcase
set incsearch

" lookings
set history=1000 
set number
set cursorline
"set cursorcolumn
set nowrap
"colorscheme darkbule
"set background=dark
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" tab indent
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" change tab file
nmap <C-j> :tabn<CR>
nmap <C-h> :tabp<CR>

nmap <F4> :set nonumber!<CR>
nmap <F5> :set list!<CR>
nmap <F6> :NERDTreeToggle<CR>

set pastetoggle=<F9>

"let g:python3_host_prog='C:/Users/foo/Envs/neovim3/Scripts/python.exe'
let g:python_host_prog='D:/libs/Python2711_x64/python.exe'

