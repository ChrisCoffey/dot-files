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
Plugin 'VundleVim/Vundle.vim'
Plugin 'ensime/ensime-vim'
Plugin 'cocoa.vim'
Plugin 'elm.vim'
Plugin 'haskellmode-vim'
Plugin 'python-mode'
Plugin 'rainbow_parentheses.vim'
Plugin 'swift.vim'
Plugin 'syntastic'
Plugin 'vim-clojure-static'
Plugin 'vim-colors-solarized'
Plugin 'vim-fireplace'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'

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

nmap <F8> :TagbarToggle<CR>

let EnErrorStyle='Underlined'

