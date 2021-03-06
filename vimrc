" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Plug 'Shougo/deoplete.nvim'
"Plug 'Shougo/echodoc.vim'
"Plug 'scrooloose/nerdcommenter'
"Plug 'svermeulen/vim-easyclip'
"Plug 'Valloric/YouCompleteMe'
"Plug 'terryma/vim-multiple-cursors'

"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'kelan/gyp.vim', { 'for':['gyp'] }
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
"Plug 'mhinz/vim-signify'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"Plug 'sheerun/vim-polyglot'
"Plug 'mitsuhiko/vim-python-combined'
Plug '~/.vim/my-plugins/my-python'
Plug 'guns/xterm-color-table.vim'
Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'bps/vim-textobj-python'
"Plug 'junegunn/vim-easy-align'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/Goyo.vim'
Plug 'luochen1990/rainbow'
Plug 'yssl/QFEnter'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-dirvish'
Plug 'godlygeek/tabular'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'flazz/vim-colorschemes'

" Initialize plugin system
call plug#end()

" set tags file
set tags=./.tags;,.tags

" common
    "
    "检测文件的类型
    "filetype plugin indent on
    "set cmdheight=2
    "set autoindent
    "set mouse=a
    "set textwidth=80
    "set list lcs=tab:\|\ 
    "set background=dark
    "colorscheme molokai
    "let g:molokai_original=1
    "let g:rehash256 = 1
    "set autoread

    filetype plugin on
    syntax on
    set nocompatible    " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
    set number          " 显示行号
    set incsearch
    set backspace=indent,eol,start
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
    set si
    set expandtab
    autocmd FileType python set noexpandtab
    autocmd FileType python set tabstop=4
    autocmd FileType cpp set noexpandtab
    autocmd FileType cpp set tabstop=4
    autocmd FileType go set noexpandtab
    autocmd FileType go set tabstop=4
    set wrap
    set nu
    set cursorline
    set ignorecase smartcase
    set hlsearch
    set noshowmode
    set signcolumn=yes
    highlight SignColumn ctermbg=black
    set laststatus=2	" Always show the statusline
    set t_Co=256		" show powerline color

    " 数字键
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

    ""让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
    set completeopt+=longest
    " 
    ""离开插入模式后自动关闭预览窗口
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    "  
    ""回车即选中当前项
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
     
    ""上下左右键的行为
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
    inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

    if !has('nvim') && &ttimeoutlen == -1
        set ttimeout
        set ttimeoutlen=100
    endif

    if !&scrolloff
        set scrolloff=1
    endif
    if !&sidescrolloff
        set sidescrolloff=5
    endif
    set display+=lastline

    if &listchars ==# 'eol:$'
        set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif
    if &history < 1000
        set history=1000
    endif
    if &tabpagemax < 50
        set tabpagemax=50
    endif

" encoding settings {{{
    if has("multi_byte")
        if &termencoding == ""
            let &termencoding = &encoding
        endif
        setglobal nobomb
        set fileencodings=ucs-bom,utf-8,gb18030,gbk,latin1

        if $LANG == "zh_CN.GBK"
            set termencoding=gb18030
            set encoding=gbk
            setglobal fileencoding=gb18030
        elseif $LANG == "zh_CN.UTF-8"
            set termencoding=utf-8
            set encoding=utf-8
            setglobal fileencoding=utf-8
        endif
    endif
" }}}

" NERDTree
    " 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
    ""autocmd VimEnter * NERDTree
    "
    "
    "" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
    let NERDTreeWinPos="right"
    "
    "" 当打开 NERDTree 窗口时，自动显示 Bookmarks
    let NERDTreeShowBookmarks=1

    ""去掉箭头，因为箭头会变成乱 
    let NERDTreeDirArrows = 0

"" powerline
    " set nocompatible   " Disable vi-compatibility
    " set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

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
    " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    let g:gutentags_project_root = ['.root', '.git', '.project']
    let g:gutentags_add_default_project_roots = 0
     
    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'
     
    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
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
    let g:python_highlight_builtin_objs = 1

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
     
    let g:Lf_FollowLinks = 1
    let g:Lf_RootMarkers = ['.project', '.leaderf', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.70
    let g:Lf_CacheDirectory = expand('~/.vim/cache')
    let g:Lf_ShowRelativePath = 1
    let g:Lf_DefaultMode = 'FullPath'
    let g:Lf_CursorBlink = 1
    let g:Lf_HideHelp = 1
    let g:Lf_DefaultExternalTool = 'rg'
    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
    let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
    " Change the highlight of matched string
    highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=4

" fzf
    let g:fzf_layout = { 'down': '~70%' }

" ack
    if executable('rg')
        let g:ackprg = 'rg --vimgrep -L'
    elseif executable('ag')
        let g:ackprg = 'ag --vimgrep -a -f'
    endif
    let g:ack_lhandler = "botright lopen 10"
    let g:ack_qhandler = "botright copen 10"
    command! -nargs=* -complete=file L          call ack#Ack('lgrep!', <q-args>)

" signify
    let g:signify_realtime = 0

" airline
    let g:airline#extensions#whitespace#checks = []

" incsearch
    "map /  <Plug>(incsearch-forward)
    "map ?  <Plug>(incsearch-backward)
    "map g/ <Plug>(incsearch-stay)

" vi-mexpand-region
    vmap v <Plug>(expand_region_expand)
    vmap V <Plug>(expand_region_shrink)

" vim-textobj
    call expand_region#custom_text_objects('python', {
	  \ 'af' :1,
	  \ 'if' :1,
	  \ })

" vim-easy-align
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)

" limelight
    let g:limelight_conceal_ctermfg = 'gray'

" rainbow
    let g:rainbow_active = 0

" dirvish
    autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

" 快捷键
    " tab indent
    vnoremap <tab> >gv
    vnoremap <s-tab> <gv

    " change tab file
    map <C-k> :tabn<CR>
    map <C-j> :tabp<CR>

    "" 按下 F2 调出/隐藏 NERDTree
    map <silent> <F2> :NERDTreeToggle<CR>

    " 开关taglist
    "map <F3> :TlistToggle<CR>
    "map <F10> :TlistToggle<CR>

    " 显示行号
    map <F4> :set nonumber!<CR>:set foldcolumn=0<CR>:set signcolumn=no<CR> 

    " 显示空白字符
    map <F5> :set list!<CR>

    map <F8> :FZF<CR>

    " 更新ctags
    "nmap <F6> :call UpdateCtags()<CR>

    " 代码检查
    " map <F7> :PymodeLint<CR>

    " command t
    " map <F1> :CommandTFlush<CR>
    " map <F8> :CommandT .<CR>

    " :UpdateTypesFile
    " map <F9> :UpdateTypesFileOnly<CR>

    " mouse right click paste
    "set mouse-=a

    " 粘贴模式
    set pastetoggle=<F9>

    " alt
    "map m :echo "ALT-M pressed"<CR>
    "map ] :tselect<CR>
    map r :RainbowToggle<CR>
    map . :profile start profile.log<CR>:profile func *<CR>:profile file *<CR>
    map / :profile pause<CR>
    map l :lclose<CR>

    " ctags 快捷键 g+]

" color
    ":runtime syntax/colortest.vim
    let cscheme = ''
    if cscheme != ''
        exec 'colorscheme '.cscheme
    else
        hi LineNr       ctermfg =250 ctermbg=236
        hi Statement    ctermfg =3
        hi Visual       ctermfg =7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
        hi Search       ctermfg =0 term=reverse ctermbg=3 guibg=Yellow
        hi SpellBad     ctermfg =0 term=reverse ctermbg=3 guibg=Yellow
        hi Boolean      ctermfg =darkcyan
        hi TabLineFill  ctermfg =black
        hi TabLineSel   ctermfg =white ctermbg=darkgray
        hi TabLine      ctermfg =grey ctermbg=black
        "hi Number      ctermfg =2
        "hi Function    ctermfg =154
        "hi String      ctermfg =3
    endif
    "hi Normal       ctermfg=white ctermbg=black

