let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
" Plug 'sheerun/vim-polyglot'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'EinfachToll/DidYouMean'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'editorconfig/editorconfig-vim'
Plug 'ludwig/split-manpage.vim'
Plug 'ap/vim-buftabline'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if v:version >= 703
  Plug 'Shougo/vimshell.vim'
endif

if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

"" Color
Plug 'owickstrom/vim-colors-paramount'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" C
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

" Go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'zchee/deoplete-go', { 'do': 'make'}

" HTML
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'mattn/emmet-vim'

" Javascript
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'moll/vim-node'
Plug 'heavenshell/vim-jsdoc'

" Elm
" Plug 'lambdatoast/elm.vim'

" Typescript
" Plug 'HerringtonDarkholme/yats.vim'

" Python
" Plug 'davidhalter/jedi-vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'ruby-formatter/rufo-vim'
Plug 'takkii/Bignyanco'

" Templating
Plug 'tmhedberg/matchit'

" Scala
" if has('python')
"     " sbt-vim
"     Plug 'ktvoelker/sbt-vim'
" endif
" Plug 'derekwyatt/vim-scala'

" Java
" Plug 'artur-shaik/vim-javacomplete2'

" Perl
" Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

" Dart
" Plug 'dart-lang/dart-vim-plugin'

"*****************************************************************************
"*****************************************************************************

call plug#end()
