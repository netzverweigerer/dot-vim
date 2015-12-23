
" vimrc - armin@arminius.org

" sensible stuff
if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 1
endif

" auto indent
if has('autocmd')
  filetype plugin indent on
endif

" enable syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=140

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set autoread
set fileformats+=mac

if &history < 1000
  set history=1000
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=256
endif

" Load matchit.vim
"runtime! macros/matchit.vim

" inoremap
inoremap <C-U> <C-G>u<C-U>

" use powerline characters with airline
let g:airline_powerline_fonts = 0
set noshowmode

" enable modeline
set modeline

" hilight search matches
set hlsearch

" This remembers where you were the last time you edited the file, and
" returns to the same position on startup
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" alias :Wq and :Q to :wq and :q to stop annoying fast typers
command Wq wq
command Q q

" highlight column 80 with different background color
"" highlight ColorColumn ctermbg=231
"" let &colorcolumn=80

" hide startup message
set shortmess=a
set shortmess+=I

" force 2 spaces tab width for specific file types
function! SetAltPrefs1()
set tabstop=2
set softtabstop=2
set shiftwidth=2
endfunction
autocmd FileType lua,bash,sh,php,xml,html,xhtml,javascript call SetAltPrefs1()

" force 4 spaces tab width for specific file types
function! SetAltPrefs2()
set tabstop=4
set softtabstop=4
set shiftwidth=4
endfunction
autocmd FileType python call SetAltPrefs2()

" set airline theme
let g:airline_theme='sol'

" always enable tabline airline extension
let g:airline#extensions#tabline#enabled = 1

set et
set bs=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set invlist

colorscheme bubblegum-256-dark

