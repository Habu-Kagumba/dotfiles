"*****************************************************************************
"" Custom configs
"*****************************************************************************


"*****************************************************************************
"" Make
"*****************************************************************************
nnoremap <silent> <F8> :!clear; make %<<CR>

"*****************************************************************************
"" Editorconfig
"*****************************************************************************
let g:EditorConfig_core_mode = 'external_command'

"*****************************************************************************
"" ALE
"*****************************************************************************
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['tslint', 'prettier'],
\   'html':       ['tidy', 'prettier'],
\   'scss':       ['stylelint', 'prettier']
\}

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

"*****************************************************************************
"" Deoplete
"*****************************************************************************
let g:deoplete#enable_at_startup = 1
let g:deoplete_disable_auto_complete=1
let g:deoplete#sources = {}
" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
    \ 'disabled_syntaxes', ['Comment', 'String'])

call deoplete#custom#option('sources', {
    \ '_': []
\})

" Language Server
let g:LanguageClient_autoStart = 1

" LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal completefunc=LanguageClient#complete
  autocmd FileType typescript setlocal completefunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif


"*****************************************************************************
"" C
"*****************************************************************************
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


"*****************************************************************************
"" Go
"*****************************************************************************
let g:polyglot_disabled = ['go']
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END


"*****************************************************************************
"" HTML
"*****************************************************************************
" for html files, 2 spaces
autocmd Filetype html setlocal ts=4 sw=4 expandtab


"*****************************************************************************
"" Javascript
"*****************************************************************************
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4 smartindent
  autocmd FileType coffee set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
  \ }


"*****************************************************************************
"" Typescript
"*****************************************************************************
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript


"*****************************************************************************
"" Python
"*****************************************************************************
let g:python_host_prog = '/Users/herbertkagumba/.asdf/installs/python/2.7.14/bin/python'
let g:python3_host_prog = '/Users/herbertkagumba/.asdf/installs/python/3.6.4/bin/python'

" vim-python
" augroup vimrc-python
"   autocmd!
"   autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
"       \ formatoptions+=croq softtabstop=4 smartindent
"       \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" augroup END

" jedi-vim
" let g:jedi#popup_on_dot = 0
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#show_call_signatures = "0"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#smart_auto_mappings = 0

" Syntax highlight
" Default highlight is better than polyglot
" let g:polyglot_disabled = ['python']
" let python_highlight_all = 1


"*****************************************************************************
"" Ruby
"*****************************************************************************
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END

autocmd Filetype eruby setlocal ts=2 sw=2 expandtab

" Insert Mode as bpry<space>
iabbr bpry require'pry';binding.pry

" Add the pry debug line with ,bp
map <Leader>bp orequire'pry';binding.pry<esc>:w<cr>
" Alias for one-handed operation:
map <Leader><Leader>p <Leader>bp

" Keep pry from annoyingly hanging around when using, e.g. pry-rescue/minitest
map <F9> :wa<cr>:call system('kill-pry-rescue')<cr>

" Nab lines from ~/.pry_history (respects "count")
nmap <Leader>ph :<c-u>let pc = (v:count1 ? v:count1 : 1)<cr>:read !tail -<c-r>=pc<cr> ~/.pry_history<cr>:.-<c-r>=pc-1<cr>:norm <c-r>=pc<cr>==<cr>
" ↑ thanks to Houl, ZyX-i, and paradigm of #vim for all dogpiling on this one.

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" Enable rufo (Ruby Format)
let g:rufo_auto_formatting = 1


"*****************************************************************************
"" Markdown
"*****************************************************************************
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'go', 'javascript']


"*****************************************************************************
"" Vim Test
"*****************************************************************************
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>s :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


"*****************************************************************************
"" EJS
"*****************************************************************************
au BufNewFile,BufRead *.ejs set filetype=html

"*****************************************************************************
"" Dart
"*****************************************************************************
let dart_html_in_string=v:true
let dart_format_on_save = 1
let dart_style_guide = 2
autocmd Filetype dart setlocal ts=2 sw=2 expandtab
