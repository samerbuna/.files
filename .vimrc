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
set expandtab               " expand tabs to spaces
set ffs=unix,dos,mac        " support these files
set formatoptions+=n        " support for numbered/bullet lists
set hidden
set history=9000            " lots of command line history
set ignorecase              " ignore case when searching
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
set nosmarttab              " fuck tabs
set nostartofline           " don't jump to the start of line when scrolling
set noswapfile              " don't keep swp files either
set nowrap                  " do not wrap lines
set nowritebackup           " do not keep a backup while working
set number                  " line numbers
set paste
set pastetoggle=<F4>
set report=0                " tell us about changes
set ruler                   " show the cursor position all the time
set scrolloff=1
set shell=bash
set shiftwidth=2            " ..
set shortmess=filtIoOA      " shorten messages
set showcmd
set showmatch               " brackets/braces that is
set sidescrolloff=5
set smartcase
set smartindent             " be smart about it
set smarttab
set softtabstop=2           " yep, two
set splitbelow
set tabpagemax=50           " open 50 tabs max
set tabstop=4
set ttimeoutlen=50          " Make Esc work faster
set viminfo='1000,f1,:100,@100,/20
set virtualedit=block       " allow virtual edit in visual block ..
set visualbell              " shut the fuck up
set whichwrap+=<,>,h,l,[,]  " backspace and cursor keys wrap to
set wildmenu                " turn on wild menu
set wildmode=list:longest,full

let mapleader=" "
nnoremap <silent> <C-K> :%s/\s\+$//g<CR>
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <silent> <Leader>t :CommandT<CR>

call pathogen#runtime_append_all_bundles()

let g:rails_ctags_arguments='--exclude="*.js"'
let g:jsx_ext_required = 0

iabbrev Lidsa     Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt u t labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut al iquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mol lit anim id est laborum

let mapleader = ","

if &grepprg ==# 'grep -n $* /dev/null'
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='TEST*.xml'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
endif

map Y y$
nnoremap <silent> <C-L> :nohls<CR><C-L>
inoremap <C-C> <Esc>`^

map <F7>  :cn<CR>
map <S-F7> :cp<CR>
map <A-F7> :copen<CR>

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
au Filetype sh,bash set ts=2 sts=2 sw=2 expandtab
let g:is_bash = 1

au BufRead,BufNewFile *.rpdf       set ft=ruby
au BufRead,BufNewFile *.rxls       set ft=ruby
au BufRead,BufNewFile *.ru         set ft=ruby
au BufRead,BufNewFile *.god        set ft=ruby
au BufRead,BufNewFile *.rtxt       set ft=html spell
au BufRead,BufNewFile *.sql        set ft=pgsql
au BufRead,BufNewFile *.rl         set ft=ragel
au BufRead,BufNewFile *.svg        set ft=svg
au BufRead,BufNewFile *.haml       set ft=haml
au BufRead,BufNewFile *.hbs        set ft=html
au BufRead,BufNewFile *.md         set ft=mkd ts=2 sw=2 expandtab
au BufRead,BufNewFile *.markdown   set ft=mkd ts=2 sw=2 expandtab
au BufRead,BufNewFile *.ronn       set ft=mkd ts=2 sw=2 expandtab
au BufRead,BufNewFile *.coffee     set ft=coffee sw=2 sts=2 isk+=$
au BufRead,BufNewFile *.slim       set ft=slim sw=2 sts=2
au Filetype gitcommit              set tw=150  spell
au Filetype ruby                   set ts=2

au BufNewFile,BufRead *.mustache   setf mustache

let g:rails_menu=2

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" set t_Co=16
set background=dark
colorscheme smyck

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=green   ctermbg=green
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black

""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif
