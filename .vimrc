" Harvey Rhody
" April 7, 2016

" References:
"  http://www.guckes.net/vim/setup.html
"  http://dougblack.io/words/a-good-vimrc.html#ui
"


" Vundle {{{
set nocompatible  " Do not use vi compatibility
filetype off	  " Need filetype off for vundle
set rtp+=~/.vim/bundle/vundle/ " Add vundle to the runtime path
call vundle#rc()	" Initialize vundle

" Add the vundle plugin
Plugin 'gmarik/vundle'
Plugin 'Rykka/riv.vim'

" Add plugins here. 
" After adding plugins must run 
" :PluginUpdate or :PluginInstall! 
" in a vim session.
"
Plugin 'scrooloose/nerdtree.git'

 "
 " Brief help on vundle
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
" }}}

filetype plugin indent on  " Done with vundle
" General {{{
set nocompatible " Turn off vi compatibility to enable lots of features in vim
set ru " Show the ruler for the cursor
set sc " showcmd shows the partial command as it is being entered
set wmnu " Use wildmenu to stuff on the status line
set nosol " Stay in same column when jumping to other lines
set ls=2 " Show a status line, even with only one window
set tw=72 " Set textwidth
set ww=<,>,h,l " Set keys that allow text to wrap to previous or next line

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set smartindent
set autoindent
set expandtab " Replace TABs with spaces
set number " Show line numbers
filetype indent on " load filetype-specific indent files
set lazyredraw " Only redraw the screen when necessary
set showmatch " highlight matching for [{()}]
" }}}

" Appearance {{{
syntax enable
syntax on
set background=dark
colorscheme badwolf
" }}}
"
" Searching {{{
set incsearch " Incremental search, as characters are entered
set hlsearch  " highlight matches
 " Turn off the highlights
nnoremap ; :noh<CR>
"  }}}

" Folding {{{
set foldenable " Enable folding
set foldlevelstart=10 " Open most folds by default
set foldnestmax=10      " Maximum number of fold levels
set modelines=1 " Check only the final line of the file for modeline commands

" semicolon open/closes folds
nnoremap <;> za 
set foldmethod=indent " fold based on indent level
" highlight last inserted text
nnoremap gV `[v`]

" }}}

" Leader Shortcuts {{{
let mapleader=","   " leader is comma
" Use jk as escape character to avoid the reach
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader><space> za " Use space to fold and unfold
nnoremap <leader>nt :NERDTree<CR>

" Shortcuts for moving between split windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" }}}
"
" Editing {{{
" LaTeX abbreviations
map! \ba {\bf a}
map! \bx {\bf x}
map! \bX {\bf X}
map! \bl {\bf l}
map! \cP {\cal P}

" Press <F5> in normal mode or in insert mode to insert the current datestamp:
" See: http://vim.wikia.com/wiki/Insert_current_date_or_time for more
" information and various versions of the datetime insertion.
nnoremap <F5> "=strftime("%a %b %d %Y")<CR>P
inoremap <F5> <C-R>=strftime("%a %b %d %Y")<CR>

" Linking markdown files to the Marked app for preview
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Syntax highlighting for .md files. The standard vim setup treats these as
" Modula-2 files, so we need to change that.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Use LaTeX math in markdown
let g:vim_markdown_math=1

" }}}
" modeline enablement for this file. Folds on the {{{ }}} markers.
" vim:foldmethod=marker:foldlevel=0
