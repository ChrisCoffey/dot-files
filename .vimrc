" Pathogen load
" filetype off

" call pathogen#infect()
" call pathogen#helptags()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required

" General
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'gregsexton/MatchTag'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-colors-solarized'
Plugin 'vim-fireplace'
Plugin 'syntastic'
Plugin 'Shougo/vimproc.vim'

" Haskell
Plugin 'lukerandall/haskellmode-vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'bitc/vim-hdevtools'

" Elm
Plugin 'elm.vim'

" Scala
Plugin 'derekwyatt/vim-scala'
Plugin 'ensime/ensime-vim'

" Clojure
Plugin 'vim-clojure-static'
Plugin 'rainbow_parentheses.vim'

" Swift
Plugin 'swift.vim'
Plugin 'cocoa.vim'

" Python
Plugin 'python-mode'

" Javascript
Plugin 'jshint/jshint'


call vundle#end()
filetype plugin indent on 
syntax on
colorscheme evening

set spelllang=en_us
set number
set tags=tags;/

set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab shiftround

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"Syntastic setup
let g:syntastic_javascript_checkers = ['jshint']

nmap <F8> :TagbarToggle<CR>

let EnErrorStyle='Underlined'

