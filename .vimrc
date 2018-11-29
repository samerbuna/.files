runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

filetype plugin indent on

set autoindent              " automatic indent new lines
set autoread                " reload files (no local changes only)
set backspace=indent,eol,start
set backupcopy=yes                     " keep attributes of original file
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set cf                      " error files / jumping
set ch=2                    " command line height
set complete-=i             " Searching includes can be slow
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap
set display=lastline        " When lines are cropped at the screen bottom, show as much as possible
set ffs=unix,dos,mac        " support these files
set formatoptions+=n        " support for numbered/bullet lists
set hidden
set history=9000            " lots of command line history
set ignorecase
set smartcase
set incsearch               " do incremental searching
set isk+=_,$,@,%,#,-        " none word dividers
set laststatus=2            " Always show status line
set list                    " show trailing whiteshace and tabs
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set mat=5                   " duration to show matching brace (1/10 sec)
set modelines=5
set nobackup                " do not keep backups after close
set nocompatible            " essential
set nohlsearch              " don't highlight searches
set nolazyredraw            " turn off lazy redraw
set noshowcmd               " don't display incomplete commands
set nostartofline           " don't jump to the start of line when scrolling
set noswapfile              " don't keep swp files either
set nowrap                  " do not wrap lines
set nowritebackup           " do not keep a backup while working
set number                  " line numbers
set paste
set report=0                " tell us about changes
set ruler                   " show the cursor position all the time
set scrolloff=1
set shell=bash
set shiftwidth=2            " ..
set shortmess=filtIoOA      " shorten messages
set showcmd
set showmatch               " brackets/braces that is
set sidescrolloff=5
set smartindent             " be smart about it
set splitbelow
set tabpagemax=50           " open 50 tabs max
set ttimeoutlen=50          " Make Esc work faster
set viminfo='1000,f1,:100,@100,/20
set virtualedit=block       " allow virtual edit in visual block ..
set novisualbell
set whichwrap+=<,>,h,l,[,]  " backspace and cursor keys wrap to
set wildmenu                " turn on wild menu
set wildmode=list:longest,full

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

let mapleader=" "
nnoremap <silent> <C-K> :%s/\s\+$//g<CR>
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
" nnoremap <silent> <Leader>t :CommandT<CR>

call pathogen#runtime_append_all_bundles()

iabbrev Lidsa     Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt u t labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut al iquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mol lit anim id est laborum

let mapleader = ","

if &grepprg ==# 'grep -n $* /dev/null'
  set grepprg=grep\ -rnH\ --exclude='*.snap'\ --exclude='.*.swp'\ --exclude='TEST*.xml'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
endif

map Y y$
nnoremap <silent> <C-L> :nohls<CR><C-L>
inoremap <C-C> <Esc>`^

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" duplicate current tab with same file+line
map ,t :tabnew %<CR>

" open directory dirname of current file, and in new tab
map ,d :e %:h/<CR>
map ,dt :tabnew %:h/<CR>

" open gf under cursor in new tab
map ,f :tabnew <cfile><CR>

autocmd FileType javascript setlocal nocindent
let g:is_bash = 1

au BufRead,BufNewFile *.sql        set ft=pgsql
au BufRead,BufNewFile *.md         set ft=mkd ts=2 sw=2 expandtab
au Filetype gitcommit              set tw=150  spell

au BufNewFile,BufRead *.mustache   setf mustache

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

syntax on
" set background=dark
" colorscheme smyck

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=green   ctermbg=green
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black

let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1

" nmap <silent> <Right>         :cnext<CR>
" nmap <silent> <Right><Right>  :cnfile<CR>
" nmap <silent> <Left>          :cprev<CR>
" nmap <silent> <Left><Left>    :cpfile<CR>
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

nmap ,l :cnext<CR>
nmap ,h :cprev<CR>
nmap ,k :cnfile<CR>
nmap ,j :cpfile<CR>

" this buffer only
" map ,bo :w | %bd | e#<CR>

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

set matchpairs+=<:>,=:;,

nnoremap / /\v
vnoremap / /\v

noremap <silent> <C-S> :update<CR>
noremap <silent> <C-M-S> :wa<CR>
" inoremap <silent> <C-S> <Esc>:update<CR>
