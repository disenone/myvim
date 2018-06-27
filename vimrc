" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Plug 'vim-scripts/L9'
"Plug 'wincent/command-t'
"Plug 'rkulla/pydiction'
"Plug 'klen/python-mode'
"Plug 'vim-scripts/taglist.vim'
"Plug 'nvie/vim-flake8'
"Plug 'powerline/powerline'
"Plug 'vim-scripts/TagHighlight'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'kelan/gyp.vim'
"Plug 'Chiel92/vim-autoformat'
"Plug 'scrooloose/syntastic'
"Plug 'vim-scripts/TagHighlight'
"Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/echodoc.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'kelan/gyp.vim', { 'for':['gyp'] }
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'guns/xterm-color-table.vim'

" Initialize plugin system
call plug#end()

" set tags file
set tags=./.tags;,.tags

" common
    "
    "¼ì²âÎÄ¼þµÄÀàÐÍ
    "filetype plugin indent on
    filetype plugin on

    "È¥µôÌÖÑáµÄÓÐ¹ØviÒ»ÖÂÐÔÄ£Ê½£¬±ÜÃâÒÔÇ°°æ±¾µÄÒ»Ð©bugºÍ¾ÖÏÞ
    set nocompatible
    "ÏÔÊ¾ÐÐºÅ
    set number
    "¼ÇÂ¼ÀúÊ·µÄÐÐÊý
    set history=1000 
    set incsearch
    set backspace=indent,eol,start
    set shiftwidth=4
    set softtabstop=4
    set si
    set expandtab
    autocmd FileType python set noexpandtab
    autocmd FileType python set tabstop=4
    set wrap
    set nu
    set cursorline
    set ignorecase smartcase
    set hlsearch
    set noshowmode
    set signcolumn=yes
    highlight SignColumn ctermbg=darkgrey
    "set cmdheight=2
    "set autoindent
    "set mouse=a
    "set textwidth=80
    "set list lcs=tab:\|\ 
    "" Êý×Ö¼ü
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

    "" syntax
    syntax on
    " :runtime syntax/colortest.vim
    "set background=dark
    "colorscheme bandit
    "let g:molokai_original=1
    "let g:rehash256 = 1
    set t_Co=256		" show powerline color
    "colorscheme molokai
    ""ÈÃVimµÄ²¹È«²Ëµ¥ÐÐÎªÓëÒ»°ãIDEÒ»ÖÂ(²Î¿¼VimTip1228)
    set completeopt+=longest
    " 
    ""Àë¿ª²åÈëÄ£Ê½ºó×Ô¶¯¹Ø±ÕÔ¤ÀÀ´°¿Ú
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    "  
    ""»Ø³µ¼´Ñ¡ÖÐµ±Ç°Ïî
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
     
    ""ÉÏÏÂ×óÓÒ¼üµÄÐÐÎª
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
    inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

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

" NERDTree
    " ÔÚ vim Æô¶¯µÄÊ±ºòÄ¬ÈÏ¿ªÆô NERDTree£¨autocmd ¿ÉÒÔËõÐ´Îª au£©
    ""autocmd VimEnter * NERDTree
    "
    "
    "" ½« NERDTree µÄ´°¿ÚÉèÖÃÔÚ vim ´°¿ÚµÄÓÒ²à£¨Ä¬ÈÏÎª×ó²à£©
    let NERDTreeWinPos="right"
    "
    "" µ±´ò¿ª NERDTree ´°¿ÚÊ±£¬×Ô¶¯ÏÔÊ¾ Bookmarks
    let NERDTreeShowBookmarks=1

    ""È¥µô¼ýÍ·£¬ÒòÎª¼ýÍ·»á±ä³ÉÂÒ 
    let NERDTreeDirArrows = 0

"" powerline
    " set nocompatible   " Disable vi-compatibility
    set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
    set laststatus=2	" Always show the statusline
    "set encoding=utf-8 " Necessary to show Unicode glyphs

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

" commant-t
    let g:CommandTFileScanner = "watchman"
    let g:CommandTSuppressMaxFilesWarning=1
    let g:CommandTCursorLeftMap = ['<BS>' , '<Left>']
    let g:CommandTBackspaceMap = '<C-h>'
    let g:CommandTWildIgnore = &wildignore . ",*.pyc"
    let g:CommandTMaxHeight = 30

" syntastic 
    let g:syntastic_python_checkers=['pyflakes']
    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    "let g:syntastic_check_on_open = 1
    "let g:syntastic_check_on_wq = 0

" gutentags
    " gutentags ËÑË÷¹¤³ÌÄ¿Â¼µÄ±êÖ¾£¬Åöµ½ÕâÐ©ÎÄ¼þ/Ä¿Â¼Ãû¾ÍÍ£Ö¹ÏòÉÏÒ»¼¶Ä¿Â¼µÝ¹é
    let g:gutentags_project_root = ['.root', '.git', '.project']
    let g:gutentags_add_default_project_roots = 0
     
    " ËùÉú³ÉµÄÊý¾ÝÎÄ¼þµÄÃû³Æ
    let g:gutentags_ctags_tagfile = '.tags'
     
    " ½«×Ô¶¯Éú³ÉµÄ tags ÎÄ¼þÈ«²¿·ÅÈë ~/.cache/tags Ä¿Â¼ÖÐ£¬±ÜÃâÎÛÈ¾¹¤³ÌÄ¿Â¼
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags
    let g:gutentags_ctags_extra_args = ['--fields=+niazlS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--Python-kinds=+px']
 
" ale
    "let g:ale_linters_explicit = 1
    let g:ale_completion_delay = 500
    let g:ale_echo_delay = 20
    let g:ale_lint_delay = 500
    let g:ale_echo_msg_format = '[%linter%] %code: %%s'
    let g:ale_lint_on_text_changed = 'nerver'
    let g:ale_lint_on_insert_leave = 0
    let g:ale_lint_on_enter = 0
    let g:airline#extensions#ale#enabled = 1
    let g:ale_set_loclist = 1
    let g:ale_open_list = 1
    let g:ale_list_window_size = 2
    augroup CloseLoclistWindowGroup              
      autocmd!
      autocmd QuitPre * if empty(&buftype) | lclose | endif
    augroup END
     
    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
    let g:ale_c_cppcheck_options = ''
    let g:ale_cpp_cppcheck_options = ''

    let g:ale_linters = {
    \   'python': ['pyflakes'],
    \}

" YouCompleteMe
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_server_log_level = 'info'
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings=1
    let g:ycm_key_invoke_completion = '<c-z>'
    set completeopt=menu,menuone
     
    noremap <c-z> <NOP>
     
    let g:ycm_semantic_triggers =  {
		\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
		\ 'cs,lua,javascript': ['re!\w{2}'],
		\ }


" vim-polyglot
    let g:python_highlight_space_errors = 0

" update ctags
    function! UpdateCtags()
            let fname=expand('%:p')
            execute "!ctags -a " . fname . " --fields=+lS -f ."
    endfunction

" LeaderF
    let g:Lf_ShortcutF = '<c-p>'
    let g:Lf_ShortcutB = 'n'
    noremap <c-n> :LeaderfMru<cr>
    noremap p :LeaderfFunction!<cr>
    noremap n :LeaderfBuffer<cr>
    noremap m :LeaderfTag<cr>
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
     
    let g:Lf_RootMarkers = ['.project', '.root', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.70
    let g:Lf_CacheDirectory = expand('~/.vim/cache')
    let g:Lf_ShowRelativePath = 1
    let g:Lf_DefaultMode = 'FullPath'
    let g:Lf_CursorBlink = 1
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
    let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}

" ¿ì½Ý¼ü
    " tab indent
    vnoremap <tab> >gv
    vnoremap <s-tab> <gv

    " change tab file
    nmap <C-k> :tabn<CR>
    nmap <C-j> :tabp<CR>
    nmap <m-]> :tselect<CR>

    "" °´ÏÂ F2 µ÷³ö/Òþ²Ø NERDTree
    nnoremap <silent> <F2> :NERDTreeToggle<CR>

    " ¿ª¹Øtaglist
    "map <F3> :TlistToggle<CR>
    "map <F10> :TlistToggle<CR>

    " ÏÔÊ¾ÐÐºÅ
    nnoremap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>:set signcolumn=no<CR> 

    " ÏÔÊ¾¿Õ°××Ö·û
    noremap <F5> :set list!<CR>

    " ¸üÐÂctags
    "nmap <F6> :call UpdateCtags()<CR>

    " ´úÂë¼ì²é
    " map <F7> :PymodeLint<CR>

    " command t
    " map <F1> :CommandTFlush<CR>
    " map <F8> :CommandT .<CR>

    " :UpdateTypesFile
    " map <F9> :UpdateTypesFileOnly<CR>

    " mouse right click paste
    "set mouse-=a

    " Õ³ÌùÄ£Ê½
    set pastetoggle=<F9>

    " alt
    "map m :echo "ALT-M pressed"<CR>
    "map ] :tselect<CR>

" color
    hi LineNr          ctermfg=250 ctermbg=236
    hi Statement       ctermfg=3
    hi Visual	ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
    hi Search	term=reverse ctermfg=0 ctermbg=3 guibg=Yellow
    hi SpellBad term=reverse ctermfg=0 ctermbg=3 guibg=Yellow
    hi Boolean ctermfg=darkcyan
    "hi Number          ctermfg=2
    "hi Function        ctermfg=154
    "hi String          ctermfg=3



