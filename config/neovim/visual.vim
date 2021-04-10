"*****************************************************************************
"" Visual Settings
"*****************************************************************************

syntax on
set ruler
set number

let no_buffers_menu=1
set background=dark

set mousemodel=popup

" Enable 24bit true color
if (has("termguicolors"))
    set termguicolors
endif

set background=dark
let g:one_allow_italics = 1 " Enable Vim-One colorscheme italics support
let g:onedark_terminal_italics = 1

try
    colorscheme one "dark
catch /.*/
    colorscheme default
endtry

" Non-printable character
" Good UTF-8 chars: ↩ ⠿↯■⌻†‖‡⍀⌇∲⊙∫
set listchars=tab:‣\ ,trail:∬,extends:⇉,precedes:⇇
set list

set showbreak=↪\    " Show wrapped lines

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"" Disable the blinking cursor.
set cursorcolumn
set cursorline
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'branch', 'readonly', 'relativepath', 'modified' ] ]
            \ },
            \ 'component': {
            \   'lineinfo': ' %3l:%-2v',
            \ },
            \ 'component_function': {
            \   'readonly': 'LightlineReadonly',
            \   'branch': 'LightlineFugitive'
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

function! s:lightline_update()
    try
        call lightline#init()
        call lightline#colorscheme()
        call lightline#update()
    catch
    endtry
endfunction
