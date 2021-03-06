"*****************************************************************************
"" Visual Settings
"*****************************************************************************

syntax on
set ruler
set number

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
    colorscheme paramount
endif
set background=dark

set mousemodel=popup
set t_Co=256

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"" Disable the blinking cursor.
set gcr=a:blinkon0
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

let s:modes = {
            \ 'n': 'NORMAL',
            \ 'i': 'INSERT',
            \ 'R': 'REPLACE',
            \ 'v': 'VISUAL',
            \ 'V': 'V-LINE',
            \ "\<C-v>": 'V-BLOCK',
            \ 'c': 'COMMAND',
            \ 's': 'SELECT',
            \ 'S': 'S-LINE',
            \ "\<C-s>": 'S-BLOCK',
            \ 't': 'TERMINAL'
            \}

let s:prev_mode = ""
function! StatusLineMode()
    let cur_mode = get(s:modes, mode(), '')

    " do not update higlight if the mode is the same
    if cur_mode == s:prev_mode
        return cur_mode
    endif

    if cur_mode == "NORMAL"
        exe 'hi! StatusLine ctermfg=249'
        exe 'hi! myModeColor cterm=bold ctermbg=148 ctermfg=22'
    elseif cur_mode == "INSERT"
        exe 'hi! myModeColor cterm=bold ctermbg=23 ctermfg=231'
    elseif cur_mode == "VISUAL" || cur_mode == "V-LINE" || cur_mode == "V_BLOCK"
        exe 'hi! StatusLine ctermfg=236'
        exe 'hi! myModeColor cterm=bold ctermbg=208 ctermfg=88'
    endif

    let s:prev_mode = cur_mode
    return cur_mode
endfunction

function! StatusLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! StatusLinePercent()
    return (100 * line('.') / line('$')) . '%'
endfunction

function! StatusLineLeftInfo()
    let branch = fugitive#head()
    if branch !=# ''
        return printf("%s |", branch)
    else
        return ''
    endif
endfunction

exe 'hi! myInfoColor ctermbg=240 ctermfg=252'

" start building our statusline
set statusline=

" mode with custom colors
set statusline+=%#myModeColor#
set statusline+=%{StatusLineMode()}
set statusline+=%*

" left information bar (after mode)
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineLeftInfo()}
set statusline+=\ %<%f%h%m
set statusline+=\ %*

" go command status (requires vim-go)
set statusline+=%#goStatuslineColor#
set statusline+=%{go#statusline#Show()}
set statusline+=%*

" right section seperator
set statusline+=%=

" filetype, percentage, line number and column number
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineFiletype()}\ %{StatusLinePercent()}\ %l:%v
set statusline+=\ %*
