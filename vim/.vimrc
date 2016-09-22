if &compatible
	set nocompatible
endif

if empty(glob('~/.vim/dein.vim'))
    silent !mkdir -p ~/.vim/plugins
    silent !git clone git@github.com:Shougo/dein.vim.git ~/.vim/dein.vim
endif

set runtimepath^=~/.vim/dein.vim

call dein#begin(expand('~/.vim/plugins'))

call dein#add('Shougo/dein.vim')

" 😈
call dein#add('ctjhoa/spacevim')

" core/root
call dein#add('easymotion/vim-easymotion')
call dein#add('kien/ctrlp.vim')
call dein#add('tpope/vim-commentary')

" core/applications
call dein#add('mbbill/undotree')

" core/behavior
call dein#add('editorconfig/editorconfig-vim')
call dein#add('haya14busa/incsearch.vim')
call dein#add('hecal3/vim-leader-guide')
call dein#add('kana/vim-arpeggio')
call dein#add('mhinz/vim-startify')
call dein#add('osyo-manga/vim-over')
call dein#add('Raimondi/delimitMate')
call dein#add('sheerun/vim-polyglot')
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-surround')

" core/files
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-eunuch')

" core/projects
call dein#add('dbakker/vim-projectroot')
call dein#add('tpope/vim-vinegar')

" core/search-symbol
call dein#add('pelodelfuego/vim-swoop')

" git
call dein#add('airblade/vim-gitgutter')
call dein#add('junegunn/gv.vim')
call dein#add('tpope/vim-fugitive')

" syntax
call dein#add('scrooloose/syntastic')

"call dein#add('Shougo/neocomplete.vim')

call dein#add('kien/rainbow_parentheses.vim')

call dein#add('morhetz/gruvbox')

call dein#end()

" install plugins if needed
if dein#check_install()
    call dein#install()
endif

" the basics
set backspace=indent,eol,start
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
filetype plugin indent on
syntax enable

" spacevim init
let mapleader = ' '
let g:leaderGuide_vertical = 1

" enable rainbow parenthesis everywhere
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set background=dark
colorscheme gruvbox
