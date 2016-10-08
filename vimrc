"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-scripts/L9'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'wincent/command-t'
NeoBundle 'rkulla/pydiction'
NeoBundle 'klen/python-mode'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'powerline/powerline'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'vim-scripts/TagHighlight'
NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'gisphm/easycolor-mirror'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
"filetype plugin indent on
filetype plugin on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"ȥ��������й�viһ����ģʽ��������ǰ�汾��һЩbug�;���
set nocompatible
"��ʾ�к�
set number
"����ļ�������
"filetype on 
"filetype plugin on
"��¼��ʷ������
set history=1000 
set incsearch
set backspace=indent,eol,start
set shiftwidth=4
set softtabstop=4
set tabstop=4
"set autoindent
set si
set noexpandtab
set wrap
set nu
set cursorline
" set mouse=a
set ignorecase smartcase
set hlsearch
" set textwidth=80
"set list lcs=tab:\|\ 
"" ���ּ�
"To have the numeric keypad working with putty / vim
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OQ /
imap <Esc>OR *
imap <Esc>Ol +
imap <Esc>OS -

" tab indent
vnoremap <tab> >gv
vnoremap <s-tab> <gv

"execute pathogen#infect()
"execute pathogen#helptags()
"execute pathogen#infect("after/{}")
"execute pathogen#infect("ftpplugin/{}")
" echofunc
let g:EchoFuncKeyPrev='<C-j>'
let g:EchoFuncKeyNext='<C-k>'

" pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict' 

"" syntax
syntax on
"set background=dark
"colorscheme bandit
"let g:molokai_original=1
"let g:rehash256 = 1
set t_Co=256		" show powerline color
"colorscheme molokai
" set background=dark
""��Vim�Ĳ�ȫ�˵���Ϊ��һ��IDEһ��(�ο�VimTip1228)
set completeopt+=longest
" 
""�뿪����ģʽ���Զ��ر�Ԥ������
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"  
""�س���ѡ�е�ǰ��
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
 
""�������Ҽ�����Ϊ
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"" �Զ���ȫ
let g:acp_completeoptPreview = 1
let g:acp_completeOption = '.,w,b,k'

""�ļ���
" �� vim ������ʱ��Ĭ�Ͽ��� NERDTree��autocmd ������дΪ au��
""autocmd VimEnter * NERDTree
"
"
"" �� NERDTree �Ĵ��������� vim ���ڵ��ҲࣨĬ��Ϊ��ࣩ
let NERDTreeWinPos="right"
"
"" ���� NERDTree ����ʱ���Զ���ʾ Bookmarks
let NERDTreeShowBookmarks=1

""ȥ����ͷ����Ϊ��ͷ������ 
let NERDTreeDirArrows = 0

"" powerline
" set nocompatible   " Disable vi-compatibility
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2	" Always show the statusline
"set encoding=utf-8 " Necessary to show Unicode glyphs
"
" flake8
autocmd FileType python map <buffer> <C-F7> :call Flake8()<CR>
let g:flake8_ignore="W191,W293,E501,E265"
" pyflakes
autocmd FileType python map <buffer> <F7> :PyflakesUpdateAndShow<CR>
let g:pyflakes_use_quickfix = 1
" Python-mode
" " Activate rope
" " Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator modes)
" " ]]            Jump on next class or function (normal, visual, operator modes)
" " [M            Jump on previous class or method (normal, visual, operator modes)
" " ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode = 0
let g:pymode_rope = 0
let g:pymode_lint_on_fly = 0
let g:pymode_indent = 0
"
" " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"
" "Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes"
" " not Auto check on save
let g:pymode_lint_on_write = 0
"
" " Support virtualenv
let g:pymode_virtualenv = 1
"
" " Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
"
" " syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = 1
"
" " Don't autofold code
let g:pymode_folding = 0
let g:pymode_lint_ignore = 'E111,W0311,W191,E501,E265'

"" stop jedi autocomplete
"let g:jedi#completions_enabled = 0
"let g:jedi#completions_command=0
let g:jedi#popup_select_first = 1
let g:jedi#popup_on_dot = 0

let g:CommandTFileScanner = "watchman"
let g:CommandTSuppressMaxFilesWarning=1
let g:CommandTCursorLeftMap = ['<BS>' , '<Left>']
let g:CommandTBackspaceMap = '<C-h>'
let g:CommandTWildIgnore = &wildignore . ",*.pyc"

" encoding settings {{{
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=gbk
	setglobal fileencoding=gb18030
	"setglobal bomb
	set fileencodings=ucs-bom,utf-8,latin1,gb18030,gbk
endif
" }}}


" update ctags
function! UpdateCtags()
	let fname=expand('%:p')
	execute "!ctags -a " . fname . " --fields=+lS -f ."
endfunction

" change tab file
nmap <C-j> :tabn<CR>
nmap <C-h> :tabp<CR>

"" ���� F2 ����/���� NERDTree
nnoremap <silent> <F2> :NERDTree<CR>

" ����taglist
map <F3> :TlistToggle<CR>
map <F10> :TlistToggle<CR>

" ��ʾ�к�
nnoremap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>

" ��ʾ�հ��ַ�
noremap <F5> :set list!<CR>

" ����ctags
nmap <F6> :call UpdateCtags()<CR>

" ������
" map <F7> :PymodeLint<CR>

" command t
nmap <F8> :CommandT .<CR>

" :UpdateTypesFile
" nmap <F9> :UpdateTypesFileOnly<CR>

" mouse right click paste
"set mouse-=a

" ճ��ģʽ
set pastetoggle=<F9>

hi LineNr          ctermfg=250 ctermbg=236
hi Statement       ctermfg=3
"hi Number          ctermfg=2
hi Visual	ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
hi Search	term=reverse ctermfg=0 ctermbg=3 guibg=Yellow
"hi Function        ctermfg=154
"hi String          ctermfg=3
hi SpellBad term=reverse ctermfg=0 ctermbg=3 guibg=Yellow
