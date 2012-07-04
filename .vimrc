runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

filetype plugin indent on

" highlight Comment         ctermfg=DarkGrey guifg=#444444
" highlight SpecialKey      ctermfg=DarkGray ctermbg=Black
" highlight StatusLine      ctermbg=Black ctermfg=LightGrey
" highlight StatusLineNC    ctermfg=Black ctermbg=DarkGrey cterm=bold

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" let g:smartusline_string_to_highlight = '(%n) %f '
let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=lightred ctermfg=black'
let g:smartusline_hi_virtual_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_normal = 'guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black'

syntax on

set autoindent              " automatic indent new lines
set autoread                " reload files (no local changes only)
set backspace=2             " allow backspacing over everything in insert mode
set backspace=indent,eol,start
set backspace=start,indent
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
set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set hidden
set history=1000            " lots of command line history
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
set pastetoggle=<F12>
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
set textwidth=80            " wrap at 80 chars by default
set ttimeoutlen=50          " Make Esc work faster
set viminfo='1000,f1,:100,@100,/20
set virtualedit=block       " allow virtual edit in visual block ..
set visualbell              " shut the fuck up
set whichwrap+=<,>,h,l,[,]  " backspace and cursor keys wrap to
set wildmenu                " turn on wild menu
set wildmode=list:longest,full

nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <C-K> :%s/\s\+$//g<CR>
nnoremap <silent> <D-R> :.Rake<CR>
nnoremap <silent> <D-r> :Rake<CR>

call pathogen#runtime_append_all_bundles()

let g:rails_ctags_arguments='--exclude="*.js"'

if &grepprg ==# 'grep -n $* /dev/null'
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='TEST*.xml'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
endif

let g:is_bash = 1 " Highlight all .sh files as if they were bash
let g:ruby_minlines = 500
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDShutUp = 1
let g:VCSCommandDisableMappings = 1

let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr(':')} = ":\r"
let g:surround_indent = 1

command! -bar -nargs=0 SudoW   :setl nomod|silent exe 'write !sudo tee % >/dev/null'|let &mod = v:shell_error
command! -bar -nargs=* -bang W :write<bang> <args>

map Y y$
nnoremap <silent> <C-L> :nohls<CR><C-L>
inoremap <C-C> <Esc>`^

cnoremap <C-O> <Up>
inoremap ø <C-O>o
inoremap <M-o> <C-O>o
inoremap <C-X><C-@> <C-A>

" If at end of a line of spaces, delete back to the previous line.
" Otherwise, <Left>
inoremap <silent> <C-B> <C-R>=getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"<CR>
cnoremap <C-B> <Left>
" If at end of line, decrease indent, else <Del>
inoremap <silent> <C-D> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"<CR>
cnoremap <C-D> <Del>
" If at end of line, fix indent, else <Right>
inoremap <silent> <C-F> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"<CR>
inoremap <C-E> <End>
cnoremap <C-F> <Right>

noremap  <F1>   <Esc>
noremap! <F1>   <Esc>

nmap \\  <Plug>NERDCommenterInvert
xmap \\  <Plug>NERDCommenterInvert

" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

iabbrev Lidsa     Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt u t labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut al iquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mol lit anim id est laborum
iabbrev rdebug    require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger

" remap <LEADER> to ',' (instead of '\')
let mapleader = ","

" quickfix mappings
map <F7>  :cn<CR>
map <S-F7> :cp<CR>
map <A-F7> :copen<CR>

" emacs movement keybindings in insert mode
inoremap <C-A> <C-O>^
cnoremap <C-A> <Home>
imap <C-e> <C-o>$
map <C-e> $
map <C-a> 0

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" do not menu with left / right in command line
cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>

" ----------------------------------------------------------------------------
"  Auto Commands
" ----------------------------------------------------------------------------

" jump to last position of buffer when opening
"au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
"                         \ exe "normal g'\"" | endif

" don't use cindent for javascript
autocmd FileType javascript setlocal nocindent

" ----------------------------------------------------------------------------
"  dbext  - connect to any database and do crazy shit
" ----------------------------------------------------------------------------

let g:dbext_default_buffer_lines = 20            " result buffer size
let g:dbext_default_use_result_buffer = 1
let g:dbext_default_use_sep_result_buffer = 1    " multiple result buffers
let g:dbext_default_type = 'pgsql'
let g:dbext_default_replace_title = 1
let g:dbext_default_history_file = '~/.dbext_history'
let g:dbext_default_history_size = 200

" ----------------------------------------------------------------------------
"  LookupFile
" ----------------------------------------------------------------------------

let g:LookupFile_TagExpr = '".ftags"'
let g:LookupFile_MinPatLength = 2
let g:LookupFile_ShowFiller = 0                  " fix menu flashiness
let g:LookupFile_PreservePatternHistory = 1      " preserve sorted history?
let g:LookupFile_PreserveLastPattern = 0         " start with last pattern?

nmap <unique> <silent> <D-f> <Plug>LookupFile
imap <unique> <silent> <D-f> <C-O><Plug>LookupFile

au Filetype sh,bash set ts=4 sts=4 sw=4 expandtab
let g:is_bash = 1

" duplicate current tab with same file+line
map ,t :tabnew %<CR>

" open directory dirname of current file, and in new tab
map ,d :e %:h/<CR>
map ,dt :tabnew %:h/<CR>

" open gf under cursor in new tab
map ,f :tabnew <cfile><CR>

" I use these commands in my TODO file
map ,a o<ESC>:r!date +'\%A, \%B \%d, \%Y'<CR>:r!date +'\%A, \%B \%d, \%Y' \| sed 's/./-/g'<CR>A<CR><ESC>
" map ,o o[ ]
" map ,O O[ ]
" map ,x :s/^\[ \]/[x]/<CR>
" map ,X :s/^\[x\]/[ ]/<CR>

function! Browser ()
    let line0 = getline (".")
    let line = matchstr (line0, "http[^ )]*")
    let line = escape (line, "#?&;|%")
    exec ':silent !open ' . "\"" . line . "\""
endfunction
map ,w :call Browser ()<CR>

au BufRead,BufNewFile *.rpdf       set ft=ruby
au BufRead,BufNewFile *.rxls       set ft=ruby
au BufRead,BufNewFile *.ru         set ft=ruby
au BufRead,BufNewFile *.god        set ft=ruby
au BufRead,BufNewFile *.rtxt       set ft=html spell
au BufRead,BufNewFile *.sql        set ft=pgsql
au BufRead,BufNewFile *.rl         set ft=ragel
au BufRead,BufNewFile *.svg        set ft=svg
au BufRead,BufNewFile *.haml       set ft=haml
au BufRead,BufNewFile *.md         set ft=mkd tw=80 ts=2 sw=2 expandtab
au BufRead,BufNewFile *.markdown   set ft=mkd tw=80 ts=2 sw=2 expandtab
au BufRead,BufNewFile *.ronn       set ft=mkd tw=80 ts=2 sw=2 expandtab

au Filetype gitcommit set tw=68  spell
au Filetype ruby      set tw=80  ts=2

au BufNewFile,BufRead *.mustache        setf mustache

let g:manpageview_pgm= 'man -P "/usr/bin/less -is"'
let $MANPAGER = '/usr/bin/less -is'
let g:rails_subversion=1
let g:rails_menu=2

command -nargs=* Xe !chmod +x <args>
command! -nargs=0 Xe !chmod +x %

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
