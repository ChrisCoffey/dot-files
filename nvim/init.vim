
call plug#begin()


" General
Plug 'VundleVim/Vundle.vim'
Plug 'majutsushi/tagbar'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-fugitive'
Plug 'vim-colors-solarized'
Plug 'vim-fireplace'
Plug 'syntastic'
Plug 'Shougo/vimproc.vim'
Plug 'jceb/vim-orgmode'
Plug 'kien/ctrlp.vim'

" Haskell
Plug 'lukerandall/haskellmode-vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'bitc/vim-hdevtools'

" Elm
Plug 'elm.vim'

" Scala
Plug 'derekwyatt/vim-sbt'
Plug 'ensime/ensime-vim'

" Clojure
Plug 'vim-clojure-static'
Plug 'rainbow_parentheses.vim'

" Swift
Plug 'swift.vim'
Plug 'cocoa.vim'

" Python
Plug 'python-mode'

" Javascript
Plug 'jshint/jshint'

call plug#end()

let mapleader = "-"
let maplocalleader= "\\"
filetype plugin indent on 
syntax on

set spelllang=en_us
set number numberwidth=2
set tags=tags;/
set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab shiftround
set nowrap

set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%=     " Right aligned from here on
set statusline+=%f
set statusline+=\ [%4L]
set statusline+=\ -\ 
set statusline+=FileType:
set statusline+=%y

" Meta mappings
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"Editing mappings
nnoremap L $l
nnoremap H ^h
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <esc> :noh<return><esc>
nnoremap <c-u> viwU
onoremap p i(
onoremap b i{
" Plugin mappings
nnoremap <leader><F7> :TagbarToggle<CR>
nnoremap <leader><F8> :EnType<CR>
nnoremap <leader><F9> :EnDeclaration<CR>

"Syntastic setup
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_javascript_checkers = ['jshint']
let EnErrorStyle='Underlined'

" Rainbow Parens
augroup parensGrp
    autocmd!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END

" Haskell Setup
augroup haskellGrp
    autocmd!
    au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
    au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
augroup END
let g:haddock_browser="open"
let g:haddock_browser_callformat="%s %s"

" Javascript Setup
augroup javascriptGrp
    autocmd!
    au FileType javascript nnoremap <buffer> :<c-u>normal! F(i function <esc> f)a{<cr><cr>}<esc>ka<tab><cr>
augroup END

" Markdown Setup
augroup markdownGrp
    autocmd!
    au FileType markdown :spell nowrap
augroup END
