"==========================================
" Author:  ruanyl
" Version: 0.9.1
" Email: ruanyl@gmail.com
" BlogPost: http://blog.bigruan.com
" ReadMe: README.md
" Last_modify: 2014-05-15
" Sections:
"     ->General Settings
"     ->Show:User Interface settings
"     ->File encode:encode for varied filetype
"     ->Others
"     ->Hot Key:Customized keys
"     ->Bundle:Plgin management and setting
"     ->Color&Theme
"==========================================

"==========================================
" General Settings
"==========================================

"history: number of command-lines remembered
set history=200

"detect filetype
filetype on
"differet indentation for differet filetype
filetype indent on
"allow plugins
filetype plugin on
"allow plugin indent
filetype plugin indent on

"Do not compatible with VI
set nocompatible
set autoread          " auto reload file after being modified
set shortmess=atI       " do not show initial page

" cancel backup
set nobackup
set noswapfile

" highlight current column and line
set cursorcolumn
set cursorline

" alway show the content on the screen after exist VIM
" in case if i did some stupid deleting, and i can find them back
set t_ti= t_te=

" disable mouse
set mouse-=a
"set selection=exclusive
set selection=inclusive
set selectmode=mouse,key

" No annoying sound on errors
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"==========================================
" Show:User Interface settings
"==========================================

" show line number
set number
" disable wrap
set nowrap

" show matched brackets
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" highlight the searching words
set hlsearch
" ingnore case when do searching
set ignorecase
" instant search
set incsearch
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" code folding
set foldenable
" folding methods
" manual
" indent    use indentation
" expr      use expressions
" syntax    use syntax based on language
" diff      fold the content which not modified
" marker    use marker to indent, the default are {{{ and }}}
set foldmethod=indent
set foldlevel=99

" Do smart autoindenting when starting a new line.
set smartindent
set autoindent    " always set autoindenting on
" never add copyindent, case error   " copy the previous indentation on autoindenting

" Number of spaces that a <Tab> in the file counts for.
set tabstop=4
" number of spaces to use for autoindenting
set shiftwidth=4
" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4
" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
" <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set smarttab

"when type <Tab>, it auto generate to <spale>
set expandtab

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set showcmd
" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast


"relative line number
set relativenumber
au FocusLost * :set number
au FocusGained * :set relativenumber
"absolte line number in Insert mode, relative line number in Normal mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"create undo file
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.undodir/
endif

set wildignore=*.swp,*.bak,*.pyc,*.class

"show the current line number and column number
set ruler
"show the current typing command
set showcmd
" Show current mode
set showmode

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

"height of command line 2
" Always show the status line
"set laststatus=2
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"==========================================
" File encode:encode for varied filetype
"==========================================

set encoding=utf-8
"auto detect file encodings
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=en
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set formatoptions+=m
"When joining lines, don't insert a space between two multi-byte characters.
set formatoptions+=B

"behaviour of insert mode completion
set completeopt=longest,menu

"auto complete command
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" when in insert mode, toggle between 'paste' and 'nopaste'
set pastetoggle=<F5>

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

"auto load vimrc file after modify. linux
autocmd! bufwritepost .vimrc source $MYVIMRC

"close popup menu when leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" setting for Python file
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

" setting for javascript file
autocmd FileType javascript,json,css,scss,html set tabstop=2 shiftwidth=2 expandtab ai

"==========================================
"Key Mappings:Customized keys
"==========================================
let mapleader = ','
let g:mapleader = ','

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

"goto older/newer position in change list
nnoremap <silent> ( g;
nnoremap <silent> ) g,


"replace currently selected text with default register without yanking it
vnoremap p "_dP

"add ; at the end of a line and begin a new line
inoremap LL <ESC>$a

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H 0
noremap L $

" Remap VIM 0 to first non-blank character
map 0 ^

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber! number?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>

nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
noremap <space> /
"map <c-space> ?"

map Y y$

noremap <silent><leader>/ :nohls<CR>

" I can type :help on my own, thanks.
noremap <F1> <Esc>"

nnoremap ; :
nnoremap ' :b

nnoremap <leader>v V`}

"Use sane regexes"
nnoremap / /\v
vnoremap / /\v

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"Use 'm' key to change buffer"
noremap m :bn<CR>
noremap M :bp<CR>

""Jump to start and end of line using the home row keys
""
nmap t o<ESC>k
nmap T O<ESC>j

" Quickly close the current window
nnoremap <leader>q :q<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" select all
map <Leader>sa ggVG"

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

"==========================================
" Bundle:Plgin management and setting
"==========================================
"package dependent:  ctags
"awesome javascript autocomplete dependent: nodejs
"python dependent:  pep8, pyflake

filetype off " required! turn off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"################### Plugins Management ###################"

Bundle 'gmarik/vundle'
" vim plugin bundle control, command model
" :BundleInstall     install
" :BundleInstall!    update
" :BundleClean       remove plugin not in list

"################### Navigation ###################"
"for nerdtree
Bundle 'scrooloose/nerdtree'
map <leader>e :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

"for tagbar
Bundle 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 50

"for file search ctrlp
Bundle 'kien/ctrlp.vim'
map <leader>m :CtrlPMRU<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>f :CtrlPMixed<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" CtrlP extensions, go to defination
" Mapping: <Leader>fu
Bundle 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>

"################### Display Enhancements ###################"

"Enhances status bar
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

"underlays the CSS colorcodes with their real color
Bundle 'gorodinskiy/vim-coloresque'

"Bundle 'oblitum/rainbow'
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"show whitespaces not used and call :FixWhitespace to remove them
" Mapping: <leader><space>
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"theme solarized
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"theme molokai
Bundle 'tomasr/molokai'
"let g:molokai_original = 1

Bundle 'chriskempson/vim-tomorrow-theme'

Bundle 'goatslacker/mango.vim'

"################### fast move ###################"

" Move to anywhere
" Mapping: <Leader>s
Bundle 'Lokaltog/vim-easymotion'
nmap <Leader>s <Plug>(easymotion-s2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

Bundle 'vim-scripts/matchit.zip'

Bundle 'Valloric/MatchTagAlways'

"################### auto complete and fast edit ###################"
" Select blocks quickly
" Mapping: <Enter>
Bundle 'gcmt/wildfire.vim'
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
    \ "html,xml" : ["at"],
\ }
let g:wildfire_fuel_map = "<ENTER>"
let g:wildfire_water_map = "<BS>"

"python autocomplete
Bundle 'davidhalter/jedi-vim'
let g:jedi#auto_initialization = 0
noremap <leader>d :call jedi#goto_definitions()<CR>
noremap <leader>g :call jedi#goto_assignments()<CR>

"For closetag
"close the tag automatically
Bundle "ruanyl/closetag.vim"
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

"for neocomplcache
Bundle 'Shougo/neocomplcache.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd Filetype css setlocal equalprg=csstidy\ -\ --silent=true
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"==================================End of neocomplcache=======================

"for xptemplate
"powerful snippets plugin, ctrl+\ to trigger
Bundle 'drmingdrmer/xptemplate'

"add comment quickly
Bundle 'scrooloose/nerdcommenter'

"add surround character quickly
" Mappings:
" surround with: ysiw
" unsurround with: ds
Bundle 'tpope/vim-surround'

"for repeat -> enhance surround.vim, . to repeat command
Bundle 'tpope/vim-repeat'

"auto complete ' " ... whatever you want
Bundle 'Raimondi/delimitMate'
" For python docstring "
au FileType python let b:delimitMate_nesting_quotes = ['"']

"for code alignment
Bundle 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

"for mutil cursor
Bundle 'terryma/vim-multiple-cursors'

"################# syntax check ###############

Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_quiet_messages = { "type": "style",
                                 \ "level": "warnings" }
highlight SyntasticErrorSign guifg=white guibg=black

" python fly check
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0

"################# Highlight ###############

"highlight for css3
Bundle 'hail2u/vim-css3-syntax'

" for python syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

" for markdown
Bundle 'tpope/vim-markdown'

" for javascript
Bundle 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

Bundle 'kchmck/vim-coffee-script'

"################## Language Specific ##################
"generate javascript doc
"key: <C-l>
Bundle 'heavenshell/vim-jsdoc'

" Provides Tern-based JavaScript editing support. Require Nodejs installed
Bundle 'marijnh/tern_for_vim'

"PHP Doc gen and better completion
Bundle 'ruanyl/PIV'
let g:DisableAutoPHPFolding = 1

Bundle 'fatih/vim-go'
let g:go_disable_autoinstall = 1

"################### Others ###################"

" Github Gist
" Command: :Gist
Bundle 'mattn/gist-vim'

"edit history, historical edit tree
Bundle 'sjl/gundo.vim'
nnoremap <leader>h :GundoToggle<CR>

"format js, html, css files
"require: npm install -g js-beautify
Bundle "Chiel92/vim-autoformat"
autocmd FileType javascript,json,html,css,scss noremap <buffer>  <leader><leader>f :Autoformat<cr>

" quick run current buffer or selected code
" Command: :QuickRun or :QuickRun {language}
Bundle 'thinca/vim-quickrun'
"autocmd FileType go noremap <buffer>  <leader>r :!go run %<cr>

Bundle 'mattn/webapi-vim'

Bundle 'tpope/vim-fugitive'

Bundle 'maxbrunsfeld/vim-yankstack'
nmap zn <Plug>yankstack_substitute_older_paste
nmap zp <Plug>yankstack_substitute_newer_paste

" delete current buffer
Bundle 'moll/vim-bbye'
nnoremap qq :Bdelete<cr>

" delete all buffers except current one.
" call :BufOnly
Bundle 'vim-scripts/BufOnly.vim'
nnoremap <silent> qo :BufOnly<CR>

"==========================================
" Color&Theme
"==========================================

filetype plugin indent on

syntax enable
syntax on

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

set background=dark
set t_Co=256

"colorscheme mango
"colorscheme Tomorrow-Night
colorscheme solarized
"colorscheme molokai
"colorscheme desert

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

