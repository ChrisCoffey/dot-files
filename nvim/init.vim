
" Plug Init ----- {{{
call plug#begin()


" General
Plug 'VundleVim/Vundle.vim'
Plug 'majutsushi/tagbar'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-fugitive'
" Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
Plug 'Shougo/vimproc.vim'
Plug 'jceb/vim-orgmode'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdtree'
Plug 'mtth/scratch.vim'
Plug 'shougo/deoplete.nvim'
Plug 'rizzatti/dash.vim'
Plug 'altercation/vim-colors-solarized'

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" Purescript
Plug 'frigoeu/psc-ide-vim' ", {'tag': '0.6.0'}
Plug 'raichoo/purescript-vim'

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
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

call plug#end()
" }}}

" Basic nav and setup ------- {{{
let mapleader = "-"
let maplocalleader= "\\"
filetype plugin indent on 
syntax on
"set shell=bash\ -i

set spelllang=en_us
set number numberwidth=2
set tags=./.tags,.tags,./tags,tags
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab shiftround
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
nnoremap <leader>tt :tabn<cr>
nnoremap <leader>a :b#<cr>
inoremap ooo <c-x><c-o>
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
onoremap n i<

"Formatting
com! FormatJSON %!python -m json.tool

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" }}}


"}}}
"
"Search mapping ---------{{{
  nnoremap <leader>t :NERDTreeToggle<cr>
"}}}

" Plugin mappings ------- {{{
" }}}

"Syntastic setup ------- {{{
" set statusline+=%{SyntasticStatuslineFlag()}
" let g:syntastic_javascript_checkers = ['eslint']
" }}}

" Neomake setup -------- {{{
let g:neomake_warning_sign = {'text': '>>'}
let g:neomake_error_sign = {'text': 'XX'}
let g:neomake_info_sign = {'text': '>>' }

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
let g:haddock_browser="open"
let g:haddock_browser_callformat="%s %s"
let g:haskellmode_completion_ghc = 1
let g:necoghc_enable_detailed_browse = 1
augroup haskellGrp
    autocmd!
    au FileType haskell nnoremap <buffer> <localleader>t :GhcModType<CR>
    au FileType haskell nnoremap <buffer> <localleader>r :GhcModTypeClear<CR>
    au FileType haskell nnoremap <buffer> <localleader>l :GhcModLint<CR>
    au FileType haskell nnoremap <buffer> <localleader>e :GhcModExpand<CR>
    au FileType haskell nnoremap <buffer> <localleader>d :GhcModSigCodegen<CR>
    au FileType haskell nnoremap <buffer> <localleader>f :GhcModInfoPreview<CR>
    au FileType haskell nnoremap <buffer> <localleader>lp :execute "normal! ggi{-# LANGUAGE #-}\<cr>\<esc>kfEa"
    au FileType haskell nnoremap <buffer> <localleader>a :GhcModCheckAndLintAsync<CR>
    
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    autocmd FileType haskell nnoremap <buffer> <leader>cc :<c-u>normal! ^i--<esc><cr>
    au BufWritePost *.hs :Neomake 
augroup END
" }}}

" Purescript Setup ------ {{{
let g:psc_ide_syntastic_mode= 1
let g:psc_ide_log_level= 1
augroup purescriptGrp
    autocmd!
    au FileType purescript nnoremap <buffer> <localleader>t :PSCIDEtype<CR>
    au FileType purescript nnoremap <buffer> <localleader>an :PSCIDEaddTypeAnnotation<CR>
    au FileType purescript nnoremap <buffer> <localleader>gt :PSCIDEgoToDefinition<CR>
    au FileType purescript nnoremap <buffer> <localleader>ap :PSCIDEapplySuggestion<CR>
    au FileType purescript nnoremap <buffer> <localleader>b !pulp build<CR>
    autocmd FileType purescript setlocal omnifunc=PSCIDEomni
    au BufWritePost FileType purescript <buffer> :call DeleteTrailingWS() 
augroup END
" }}}

" Javascript Setup ------- {{{
augroup javascriptGrp
    autocmd!
    au FileType javascript nnoremap <buffer> <leader>=>  :<c-u>normal! F(i function <esc> f)a{<cr><cr>}<esc>ka<tab><cr>
    au FileType javascript nnoremap <buffer> <localleader>cc :<c-u>normal! ^i//<esc><cr>
    au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 
    au FileType javascript.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 
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
augroup END
" }}}

" Vimscript Setup --------- {{{
augroup vimscriptGrp
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

"Register deoplete -------- {{{
call remote#host#RegisterPlugin('python3', '/home/ccoffey/.config/nvim/plugged/deoplete.nvim/rplugin/python3/deoplete/deoplete.py', [
      \ {'sync': 1, 'name': 'DeopleteInitializePython', 'type': 'command', 'opts': {}},
     \ ])

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

let startHour = strftime('%H')
if (startHour > 7) && (startHour < 16)
    :exec "colorscheme solarized"
endif
