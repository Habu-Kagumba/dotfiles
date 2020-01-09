"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set inccommand=nosplit

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

"" Split below
set splitbelow

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_command_aliases = 1

" Clean search (highlight)
nmap <silent> <BS> :nohlsearch<CR>

" Clipboard size
if has('persistent_undo')
	set undofile
endif

set undodir=$HOME/.VIM_UNDO_FILES

set undolevels=5000

" Map <F6> to generate ctags
nnoremap <F6> :!ctags -R<cr>
" Automatically generate ctags on save.
" autocmd BufWritePost * call system("ctags -R")

" Matchpairs
set matchpairs+=<:>,=:;

" Paste
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>

" remap <ESC>
inoremap jk <Esc>

" remap completion
inoremap <leader>, <C-x><C-p>

" enable mouse scrolling
set mouse=a

" relativenumber
set rnu

" switch number style
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set nu
  else
    set rnu
    set nonu
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<cr>

" re-indent whole file
map <F7> mzgg=G`z`

" Resize
nnoremap <silent> <Leader>- :exe "vertical resize 100"<CR>

" Alphanumerics
"alphsubs ---------------------- {{{
execute "digraphs ks " . 0x2096
execute "digraphs as " . 0x2090
execute "digraphs es " . 0x2091
execute "digraphs hs " . 0x2095
execute "digraphs is " . 0x1D62
execute "digraphs ks " . 0x2096
execute "digraphs ls " . 0x2097
execute "digraphs ms " . 0x2098
execute "digraphs ns " . 0x2099
execute "digraphs os " . 0x2092
execute "digraphs ps " . 0x209A
execute "digraphs rs " . 0x1D63
execute "digraphs ss " . 0x209B
execute "digraphs ts " . 0x209C
execute "digraphs us " . 0x1D64
execute "digraphs vs " . 0x1D65
execute "digraphs xs " . 0x2093
"}}}


" Add shebang info to files
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># encoding: UTF-8\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END

"" Explorer
nnoremap <silent> <F3> :Vexplore<CR>
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_banner=0
