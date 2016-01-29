
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

filetype plugin indent on 
syntax on

set spelllang=en_us
set number
set tags=tags;/

set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab shiftround

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nnoremap <esc> :noh<return><esc>

"Syntastic setup
let g:syntastic_javascript_checkers = ['jshint']

nmap <F7> :TagbarToggle<CR>
nmap <F8> :EnType<CR>
nmap <F9> :EnDeclaration<CR>

let EnErrorStyle='Underlined'


" Rainbow Parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Haskell Setup
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
let g:haddock_browser="open"
let g:haddock_browser_callformat="%s %s"



