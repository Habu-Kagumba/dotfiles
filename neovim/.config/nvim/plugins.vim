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
Plug 'Yggdroot/indentLine'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'EinfachToll/DidYouMean'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'editorconfig/editorconfig-vim'

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}, 'branch': 'release'}
" Common COC plugins
Plug 'neoclide/coc-snippets', {'do': 'npm ci'}
Plug 'neoclide/coc-solargraph', {'do': 'npm ci'}
Plug 'neoclide/coc-tsserver', {'do': 'npm ci'}
Plug 'neoclide/coc-lists', {'do': 'npm ci'}
Plug 'neoclide/coc-highlight', {'do': 'npm ci'}
Plug 'neoclide/coc-prettier', {'do': 'npm ci'}
Plug 'neoclide/coc-eslint', {'do': 'npm ci'}
Plug 'neoclide/coc-stylelint', {'do': 'npm ci'}
Plug 'neoclide/coc-css', {'do': 'npm ci'}
Plug 'neoclide/coc-json', {'do': 'npm ci'}
Plug 'neoclide/coc-html', {'do': 'npm ci'}
Plug 'neoclide/coc-rls', {'do': 'npm ci'}

Plug 'honza/vim-snippets'

Plug 'kien/tabman.vim'

"" Color
Plug 'owickstrom/vim-colors-paramount'

"" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" C
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

" Go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" HTML
Plug 'mattn/emmet-vim'

" Javascript
Plug 'pangloss/vim-javascript'

" Elm
" Plug 'lambdatoast/elm.vim'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'

" Python
" Plug 'davidhalter/jedi-vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'

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
