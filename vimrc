" ----------------------------------------------------------------------------
" Author:  ruanyl
" Version: 1.1
" ----------------------------------------------------------------------------

set nocompatible

"Load plugins
if filereadable(expand("~/.vim/vimrc.before"))
  source ~/.vim/vimrc.before
endif

"Load plugins
if filereadable(expand("~/.vim/vimrc.bundles"))
  source ~/.vim/vimrc.bundles
endif

filetype plugin indent on
syntax enable
syntax on

"colorscheme gruvbox
colorscheme solarized
"colorscheme molokai
"colorscheme desert

set background=dark
set t_Co=256
set history=200           "history: number of command-lines remembered
set autoread              " auto reload file after being modified
set shortmess=atI         " do not show initial page
set nobackup
set noswapfile
set cursorcolumn          " highlight current column
set cursorline            " highlight current line
set t_ti= t_te=           " alway show the content on the screen after exist VIM
set mouse-=a              " disable mouse
set selection=inclusive   "set selection=exclusive
set selectmode=mouse,key
set title                 " change the terminal's title
set novisualbell          " don't beep
set noerrorbells          " don't beep
set t_vb=
set tm=500
set nostartofline         " keep cursor postion when switching between buffers

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

set hidden            " A buffer becomes hidden when it is abandoned
set wildmode=longest:full,full
set ttyfast

set relativenumber " show relative line number
set ruler          " show the current line number and column number
set showcmd        " show the current typing command
set noshowmode     " Show current mode
set scrolloff=7    " Set 7 lines to the cursor - when moving vertically using j/k

" File encode:encode for varied filetype
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=en
set termencoding=utf-8

set ffs=unix,dos,mac         " Use Unix as the standard file type
set formatoptions+=m
set formatoptions+=B         " When joining lines, don't insert a space between two multi-byte characters.
set completeopt=longest,menu " behaviour of insert mode completion
set wildmenu                 " auto complete command
set wildignore=**.o,*~,.swp,*.bak,*.pyc,*.class " Ignore compiled files

set viminfo^=% " Remember info about open buffers on close
set magic      " For regular expressions turn magic on

set backspace=eol,start,indent               " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set pastetoggle=<F5>                         " when in insert mode, toggle between 'paste' and 'nopaste'

"let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn="120"

autocmd InsertEnter * :set norelativenumber " no relativenumber in insert mode
autocmd InsertLeave * :set relativenumber   " show relativenumber when leave insert mode

"create undo file
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.undodir/
endif


if has('statusline')
    set laststatus=2
endif


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
au InsertLeave * set nopaste

"close popup menu when leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType javascript,json,css,scss,html set tabstop=2 shiftwidth=2 expandtab ai

autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

" ----------------------------------------------------------------------------
" Key Mappings:Customized keys
" ----------------------------------------------------------------------------

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

"Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H 0
noremap L $
noremap Y y$

" Remap VIM 0 to first non-blank character
noremap 0 ^

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"no Highlight
noremap <silent><leader>/ :nohls<CR>

" I can type :help on my own, thanks.
noremap <F1> <Esc>"

nnoremap ; :
nnoremap ' :b

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
noremap <Leader>sa ggVG

nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>

" toggle between two buffers
nnoremap t <C-^>

"" Vmap for maintain Visual Mode after shifting > and <
vnoremap < <gv
vnoremap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Quick move in insert mode
inoremap <C-o> <Esc>o
inoremap <C-a> <Home>
inoremap <C-e> <End>

if has('macunix')
  " pbcopy for OSX copy/paste
  vnoremap <C-x> :!pbcopy<CR>
  vnoremap <C-c> :w !pbcopy<CR><CR>
endif

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

" Because Vim doesn't like
" pasting that works.
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

"Load local settings
if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif
