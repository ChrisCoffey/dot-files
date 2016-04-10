
" Plug Init ----- {{{
call plug#begin()


" General
Plug 'VundleVim/Vundle.vim'
Plug 'majutsushi/tagbar'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'Shougo/vimproc.vim'
Plug 'jceb/vim-orgmode'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdtree'
Plug 'mtth/scratch.vim'

" Haskell
Plug 'lukerandall/haskellmode-vim'
Plug 'bitc/vim-hdevtools'

" Elm
Plug 'elm.vim'

" Scala
Plug 'derekwyatt/vim-sbt'
Plug 'ChrisCoffey/ensime-vim'

" Clojure
Plug 'rainbow_parentheses.vim'

" Swift
Plug 'cocoa.vim'

" Python
Plug 'klen/python-mode'

" Javascript
Plug 'wookiehangover/jshint.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

call plug#end()
" }}}

" Basic nav and setup ------- {{{
let mapleader = "-"
let maplocalleader= "\\"
filetype plugin indent on 
syntax on

set spelllang=en_us
set number numberwidth=2
set tags=./.tags,.tags,./tags,tags
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
set statusline+=\ col:\ %c,
" }}}

" Meta mappings ------- {{{
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>org :Ex **/*.org <cr>
nnoremap <leader>wl <c-w>l
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>a :b#<cr>
" }}}

"Editing mapping ------- {{{
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <localleader>dg <c-k>

nnoremap L $l
nnoremap H ^h
nnoremap <esc> :noh<return><esc>
nnoremap <c-u> viwU

onoremap p i(
onoremap b i{
onoremap sb i[

" }}}

"Search mapping ---------{{{
  nnoremap <leader>t :NERDTreeToggle<cr>
"}}}

" Plugin mappings ------- {{{
" }}}

"Syntastic setup ------- {{{
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_javascript_checkers = ['jshint']
" }}}

" Ensime --------- {{{
augroup scalaGrp
    autocmd!
    au FileType scala nnoremap <buffer> <localleader>p :<c-u>normal! ^iprivate <esc><cr>
    au FileType scala setlocal foldmethod=syntax
    au FileType scala normal zR
    au FileType scala nnoremap <buffer> <localleader>cc :<c-u>normal! ^i//<esc><cr>
    au BufWritePost *.scala :EnTypeCheck
    nnoremap <localleader>t :EnType<CR>
    nnoremap <localleader>d :EnDeclaration<CR>
    nnoremap <localleader>dh :EnDeclarationSplit<CR>
    nnoremap <localleader>dv :EnDeclarationSplit v<CR>
augroup END
" }}}

" Rainbow Parens ------- {{{
augroup parensGrp
    autocmd!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END
" }}}

" Haskell Setup ------- {{{
augroup haskellGrp
    autocmd!
    au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
    au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
    autocmd FileType haskell nnoremap <buffer> <leader>cc :<c-u>normal! ^i--<esc><cr>
augroup END
let g:haddock_browser="open"
let g:haddock_browser_callformat="%s %s"

" }}}

" Javascript Setup ------- {{{
augroup javascriptGrp
    autocmd!
    au FileType javascript nnoremap <buffer> <leader>=>  :<c-u>normal! F(i function <esc> f)a{<cr><cr>}<esc>ka<tab><cr>
    au FileType javascript nnoremap <buffer> <localleader>cc :<c-u>normal! ^i//<esc><cr>
augroup END

augroup typescriptGrp
    autocmd!
    autocmd FileType typescript nmap <buffer> <localleader>r :<C-u>echo tsuquyomi#hint()<CR>
    autocmd FileType typescript nnoremap <localleader>c :exec "!tsc"<cr>:exec "!webpack"<cr>:exec "redraw!"<cr>
augroup END
" }}}

" Markdown Setup ------- {{{
augroup markdownGrp
    autocmd!
    au FileType markdown :spell nowrap
augroup END
" }}}

" Vimscript Setup --------- {{{
augroup vimscriptGrp
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
