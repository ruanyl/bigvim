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

set nocompatible          " Do not compatible with VI

set history=200           "history: number of command-lines remembered

set autoread              " auto reload file after being modified
set shortmess=atI         " do not show initial page

set nobackup
set noswapfile

set cursorcolumn          " highlight current column
set cursorline            " highlight current line

set t_ti= t_te=           " alway show the content on the screen after exist VIM
                          " in case if i did some stupid deleting, and i can find them back

set mouse-=a              " disable mouse

set selection=inclusive   "set selection=exclusive
set selectmode=mouse,key

                          " No annoying sound on errors
set title                 " change the terminal's title
set novisualbell          " don't beep
set noerrorbells          " don't beep
set t_vb=
set tm=500

set nostartofline         " keep cursor postion when switching between buffers

"==========================================
" Show:User Interface settings
"==========================================

set number " show line number
set nowrap " disable wrap

"set list
"set listchars=tab:›\ ,trail:•,extends:❯,precedes:❮

set showmatch         " show matched brackets
set mat=2             " How many tenths of a second to blink when matching brackets

set hlsearch          " highlight the searching words
set ignorecase        " ingnore case when do searching

set incsearch         " instant search
set smartcase         " ignore case if search pattern is all lowercase, case-sensitive otherwise

set foldenable        " code folding
set foldmethod=indent " options: manual, indent, expr, syntax, diff, marker
set foldlevel=99

set smartindent       " Do smart autoindenting when starting a new line
set autoindent        " always set autoindenting on

set tabstop=4         " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4      " number of spaces to use for autoindenting
set softtabstop=4     " Number of spaces that a <Tab> counts for while performing editing operations
set smarttab
set expandtab         " when typing <Tab>, use <space> instead
set shiftround        " use multiple of shiftwidth when indenting with '<' and '>'

set showcmd           " Show partial commands in status line and Selected characters/lines in visual mode

set hidden            " A buffer becomes hidden when it is abandoned
set wildmode=longest:full,full
set ttyfast

set relativenumber                          " show relative line number
autocmd InsertEnter * :set norelativenumber " no relativenumber in insert mode
autocmd InsertLeave * :set relativenumber   " show relativenumber when leave insert mode

"create undo file
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.undodir/
endif

set ruler       " show the current line number and column number
set showcmd     " show the current typing command
set noshowmode    " Show current mode
set scrolloff=7 " Set 7 lines to the cursor - when moving vertically using j/k

if has('statusline')
    set laststatus=2
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
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=en
set termencoding=utf-8

set ffs=unix,dos,mac         " Use Unix as the standard file type
set formatoptions+=m
set formatoptions+=B         " When joining lines, don't insert a space between two multi-byte characters.
set completeopt=longest,menu " behaviour of insert mode completion
set wildmenu                 " auto complete command
set wildignore=**.o,*~,.swp,*.bak,*.pyc,*.class " Ignore compiled files

                    " if this not work ,make sure .viminfo is writable for you
if has("autocmd")   " remember the last cursor postion when reopen a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set viminfo^=% " Remember info about open buffers on close
set magic      " For regular expressions turn magic on

set backspace=eol,start,indent               " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set pastetoggle=<F5>                         " when in insert mode, toggle between 'paste' and 'nopaste'
au InsertLeave * set nopaste                 " disbale paste mode when leaving insert mode
autocmd! bufwritepost .vimrc source $MYVIMRC " auto load vimrc file after modify

"close popup menu when leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType javascript,json,css,scss,html set tabstop=2 shiftwidth=2 expandtab ai

"==========================================
"Key Mappings:Customized keys
"==========================================
let mapleader = ','
let g:mapleader = ','

command! W w !sudo tee % > /dev/null

"goto older/newer position in change list
nnoremap <silent> ( g;
nnoremap <silent> ) g,

"replace currently selected text with default register without yanking it
vnoremap p "_dP

" use ctrl-c to copy to system clipboard
vnoremap <C-c> "*y

" use <C-V> to paste yanked content
inoremap <C-V> <C-R>"

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
map Y y$

" Remap VIM 0 to first non-blank character
map 0 ^

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"no Highlight
noremap <silent><leader>/ :nohls<CR>

" I can type :help on my own, thanks.
noremap <F1> <Esc>"

nnoremap ; :
nnoremap ' :b

nnoremap <leader>v V`}

"Use sane regexes !not used!
nnoremap / /\v
vnoremap / /\v

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"Use 'm/M' to move among buffers
noremap m :bn<CR>
noremap M :bp<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" select all
map <Leader>sa ggVG"

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>

" toggle between two buffers
nnoremap t <C-^>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"==========================================
" Bundle:Plgin management and setting
"==========================================
"package dependent:  ctags
"awesome javascript autocomplete dependent: nodejs

call plug#begin('~/.vim/bundle')

"################### Plugins Management ###################"

" vim plugin bundle control, command model
" :PlugInstall     install
" :PlugInstall!    update
" :PlugClean       remove plugin not in list

"################### Navigation ###################"
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
map <leader>e :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

Plug 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 50

Plug 'ctrlpvim/ctrlp.vim'
map <leader>m :CtrlPMRU<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>f :CtrlPMixed<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](node_modules|target|dist)|\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
let g:ctrlp_follow_symlinks=1

" CtrlP extensions, go to defination
" Mapping: <Leader>fu
Plug 'tacahiroy/ctrlp-funky'
let g:ctrlp_funky_matchtype = 'path'
nnoremap <Leader>fu :CtrlPFunky<Cr>

Plug 'sgur/ctrlp-extensions.vim'
nnoremap <Leader>cy :CtrlPYankring<Cr>

Plug 'dyng/ctrlsf.vim', {'on': 'CtrlSFVwordExec'}
vmap <Leader>s <Plug>CtrlSFVwordExec

Plug 'rking/ag.vim'
nnoremap <Leader><Leader>a :Ag!<space>
let g:ag_working_path_mode='r'


"################### Display Enhancements ###################"
let g:netrw_liststyle=3
"Enhances status bar
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

" css/less/sass/html color preview
Plug 'gorodinskiy/vim-coloresque'

"show whitespaces not used and call :FixWhitespace to remove them
" Mapping: <leader><space>
Plug 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"Plug 'ruanyl/trailing-tab.vim'
"let g:extra_tab_ignored_filetypes = ['php']

" auto save views when exist vim
" auto open views when open vim
" this will create a `session` dir in your `.vim` dir
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

Plug 'MattesGroeger/vim-bookmarks'
nmap <Leader><Leader>m <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll

" highlights the enclosing html/xml tags
Plug 'Valloric/MatchTagAlways'

" Maximize split window
Plug 'szw/vim-maximizer'
nnoremap <tab> :MaximizerToggle<CR>

"################### Themes ###################"

"theme solarized
Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

"theme molokai
Plug 'tomasr/molokai'
"let g:molokai_original = 1


"################### fast move ###################"

" Move to anywhere
" Mapping: s
Plug 'Lokaltog/vim-easymotion'
map <space> <Plug>(easymotion-s2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

" extended % matching for HTML, LaTeX, and many other languages
Plug 'vim-scripts/matchit.zip'

"################### auto complete and fast edit ###################"
" Select blocks quickly
" Mapping: <Enter>
Plug 'gcmt/wildfire.vim'
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
    \ "html,xml" : ["at"],
\ }
let g:wildfire_fuel_map = "<ENTER>"
let g:wildfire_water_map = "<BS>"

" auto close html tag when press >
Plug 'alvan/vim-closetag'

Plug 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::', '(', 'use ', 'namespace ', '\'],
            \   'cs,java,typescript,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'html': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'haskell' : ['.', 're!.'],
            \   'css': [ 're!^\s{2,4}', 're!:\s+' ],
            \ }

"powerful snippets plugin, ctrl+\ to trigger
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-\\>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"add comment quickly
Plug 'scrooloose/nerdcommenter'

"add surround character quickly
" Mappings:
" surround with: ysiw
" unsurround with: ds
Plug 'tpope/vim-surround'

"for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'

Plug 'Raimondi/delimitMate'
let delimitMate_matchpairs = "(:),[:],{:}"

"for code alignment
Plug 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>

"for mutil cursor
Plug 'terryma/vim-multiple-cursors'

Plug 'mattn/emmet-vim'

Plug 'Ioannis-Kapoulas/vim-autoprefixer'

"################# syntax check ###############

Plug 'scrooloose/syntastic'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='~'
let g:syntastic_style_warning_symbol='⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_javascript_checkers = ['eslint']
"################# Highlight ###############

"highlight for css3
Plug 'hail2u/vim-css3-syntax'

" for markdown
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_frontmatter=1

" for javascript
Plug 'pangloss/vim-javascript', {'branch': 'develop'}

Plug 'ruanyl/vim-fixmyjs', {'on': 'Fixmyjs'}

Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}

"Syntax for JavaScript libraries
Plug 'othree/javascript-libraries-syntax.vim'

"AngularJS with Vim
Plug 'burnettk/vim-angular'

" ReactJS
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

"################## Language Specific ##################
"generate javascript doc
Plug 'heavenshell/vim-jsdoc'
let g:jsdoc_default_mapping = 0
autocmd FileType javascript nnoremap <Leader><Leader>d :JsDoc<CR>

" Provides Tern-based JavaScript editing support. Require Nodejs installed
Plug 'marijnh/tern_for_vim'
let tern_show_signature_in_pum = 1
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Up to date PHP syntax
Plug 'StanAngeloff/php.vim', {'for': 'php'}

" improved PHP omnicompletion
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}

Plug 'ruanyl/vim-php-manual', {'for': 'php'}
let g:php_manual_enable_online_search = 0

" composer project php auto completion
" Generate Index: :call padawan#GenerateIndex()
" Start Server: :call padawan#StartServer()
" Stop Server: :call padawan#StopServer()
" Restart Server: :call padawan#RestartServer()
" cd ~/.vim/bundle/padawan.vim/padawan.php && composer install
Plug 'mkusher/padawan.vim', {'for': 'php'}

Plug 'ruanyl/vim-caniuse', {'on': 'Caniuse'}

"################### Others ###################"

"edit history, historical edit tree
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
nnoremap <leader>h :GundoToggle<CR>
let g:gundo_auto_preview = 0

"format js, html, css files
"require: npm install -g js-beautify
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
autocmd FileType javascript,json,html,css,scss noremap <buffer>  <leader><leader>f :Autoformat<cr>

" quick run current buffer or selected code
" Command: :QuickRun or :QuickRun {language}
Plug 'thinca/vim-quickrun'
"autocmd FileType go noremap <buffer>  <leader>r :!go run %<cr>

Plug 'mattn/webapi-vim'

Plug 'tpope/vim-fugitive'

" delete current buffer
Plug 'moll/vim-bbye'
nnoremap qq :Bdelete<cr>

" delete all buffers except current one.
" call :BufOnly
Plug 'vim-scripts/BufOnly.vim'
nnoremap <silent> qo :BufOnly<CR>

Plug 'editorconfig/editorconfig-vim'

call plug#end()

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

autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
