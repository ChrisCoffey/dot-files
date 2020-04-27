set mouse=a
" Plug Init -----
call plug#begin()
let curdir = getcwd()

" General
Plug 'VundleVim/Vundle.vim'
Plug 'majutsushi/tagbar'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
" Plug 'neomake/neomake'
Plug 'Shougo/vimproc.vim'
Plug 'jceb/vim-orgmode'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdtree'
Plug 'mtth/scratch.vim'
Plug 'shougo/deoplete.nvim'
Plug 'rizzatti/dash.vim'
Plug 'junegunn/fzf'
Plug 'altercation/vim-colors-solarized'
Plug 'elixir-editors/vim-elixir'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Plug 'w0rp/ale'

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Haskell
Plug 'eagletmt/ghcmod-vim'
" Plug 'eagletmt/neco-ghc'
Plug 'bitc/vim-hdevtools'
" Plug 'parsonsmatt/intero-neovim'

" Purescript
Plug 'frigoeu/psc-ide-vim'
Plug 'raichoo/purescript-vim'

" Scala
Plug 'derekwyatt/vim-sbt'
" Plug 'ensime/ensime-vim'

" Clojure
Plug 'kien/rainbow_parentheses.vim'

" F#
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}

" Python
Plug 'klen/python-mode'

" Javascript
" Plug 'wookiehangover/jshint.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()
"

" Basic nav and setup -------
let mapleader = "-"
let maplocalleader= "\\"
filetype plugin indent on
syntax on

let g:scratch_horizontal=0
set updatetime=250
"set shell=bash\ -i

set spelllang=en_us
set number numberwidth=2
set tags=./.tags,.tags,./tags,tags;/
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab shiftround
set nowrap
" set colorcolumn=100

set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%=     " Right aligned from here on
set statusline+=%f
set statusline+=\ [%4L]
set statusline+=\ -\
set statusline+=FileType:
set statusline+=%y
set statusline+=\ col:\ %c,



"

" Meta mappings -------
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>org :Ex **/*.org <cr>
nnoremap <leader>wl <c-w>l
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>0 :tabn<cr>
nnoremap <leader>1 :tabp<cr>
nnoremap <leader>a :b#<cr>
inoremap ooo <c-x><c-o>
"

"Editing mapping -------
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

nnoremap <leader>gu :exec "silent !uuidgen \| pbcopy"<cr>"+p

au BufWritePre * call DeleteTrailingWS()
"


"}}}
"
"Search mapping ---------
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap ff :FZF<cr>

" Plugin mappings -------
"

"Syntastic setup -------
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['bundle exec rubocop', 'bundle exec mri']
"

" Neomake setup --------
" let g:neomake_warning_sign = {'text': '>>'}
" let g:neomake_error_sign = {'text': 'XX'}
" let g:neomake_info_sign = {'text': '>>' }

"

" GitGutter setup

"

" LanguageClient Setup
set hidden
" let g:ale_elixir_elixir_ls_release = '/Users/chriscoffey/workspace/open_source/elixir-ls/rel'

let g:LanguageClient_devel = 0
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
let g:LanguageClient_selectionUI = 'location-list'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'haskell': ['~/.local/bin/hie-wrapper', '-r', curdir, '-d'],
    \ 'javascript': ['javascript-typescript-langserver'],
    \ 'python': ['pyls'],
    \ 'elixir': ['~/workspace/open_source/elixir-ls/rel/language_server.sh'],
    \ 'purescript': ['npx purescript-language-server --stdio'],
    \ 'ruby': ['tcp://localhost:7658']
    \ }

nnoremap <localleader>f :call LanguageClient_textDocument_hover()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"" Ale language client
" let g:ale_completion_enabled = 1
" let g:ale_fix_on_save = 1

"augroup aleGrp
"    nnoremap <buffer> <localleader>d :ALEGoToDefinition
"    nnoremap <buffer> <localleader>r :ALEFindReferences
"    nnoremap <buffer> <localleader>e :ALEHover
"
"augroup END

" By default don't consider '.' as part of a word, but enable it using
" <leader>j to allow qualfied name lookups in lsp servers
set iskeyword=a-z,A-Z,_,39
nnoremap <leader>k :set iskeyword=a-z,A-Z,_,39
nnoremap <leader>j :set iskeyword=a-z,A-Z,_,.,39


" Ensime ---------
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
"

" Rainbow Parens -------
augroup parensGrp
    autocmd!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END
"

set iskeyword=a-z,A-Z,_,.,39
nnoremap <leader>k :set iskeyword=a-z,A-Z,_,39<CR>
nnoremap <leader>j :set iskeyword=a-z,A-Z,_,.,39<CR>
" Haskell Setup -------
let g:haddock_browser="open"
let g:haddock_browser_callformat="%s %s"
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
augroup haskellGrp
    autocmd!
    hi link ALEError Error
    hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
    hi link ALEWarning Warning
    hi link ALEInfo SpellCap
    au FileType haskell nnoremap <buffer> <localleader>lg :call LanguageClient#textDocument_definition()<CR>
    au FileType haskell nnoremap <buffer> <localleader>lr :call LanguageClient#textDocument_rename()<CR>
    au FileType haskell nnoremap <buffer> <localleader>lf :call LanguageClient#textDocument_formatting()<CR>
    au FileType haskell nnoremap <buffer> <localleader>lb :call LanguageClient#textDocument_references()<CR>
    au FileType haskell nnoremap <buffer> <localleader>la :call LanguageClient#textDocument_codeAction()<CR>
    au FileType haskell nnoremap <buffer> <localleader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

    " Update my tags files
    au BufWritePost *.hs silent !init-tags %
    au BufWritePost *.hsc silent !init-tags %

    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    " au BufWritePost *.hs :Neomake
augroup END
"

" Purescript Setup ------
let g:psc_ide_syntastic_mode= 1
let g:psc_ide_log_level= 0
let g:psc_ide_server_runner=["yarn", "--silent", "purs"]
let g:purescript_indent_let = 0
let g:purescript_indent_where = 0
let g:purescript_indent_dot = 0
augroup purescriptGrp
    au!
    au FileType purescript nnoremap <buffer> <localleader>t :Ptype<CR>
    au FileType purescript nnoremap <buffer> <localleader>an :PaddType<CR>
    au FileType purescript nnoremap <buffer> <localleader>gt :Pgoto<CR>
    au FileType purescript nnoremap <buffer> <localleader>d :Ppursuit<CR>
    au FileType purescript nnoremap <buffer> <localleader>ap :Papply!<CR>
    au FileType purescript nnoremap <buffer> <localleader>ac :Pcase!<CR>
    au FileType purescript nnoremap <buffer> <localleader>b !yarn pulp build<CR>
    autocmd FileType purescript setlocal omnifunc=PSCIDEomni
augroup END
"

" Javascript Setup -------
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
"

" Rust Setup ----------
augroup rustGrp
    autocmd!
augroup END
"

" Ruby Setup
function! RubocopAutocorrect()
  execute "!bundle exec bundle exec rubocop -a " . bufname("%")
  call SyntasticCheck()
endfunction

augroup rubyGrp
    au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
    au FileType ruby nnoremap <buffer> <localleader>cop :call RubocopAutocorrect()<cr>
augroup END

"

" Markdown Setup -------
augroup markdownGrp
    autocmd!
    au FileType markdown set spell
    " au FileType markdown inoremap .. .\r
augroup END
"

" Vimscript Setup ---------
augroup vimscriptGrp
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"

" F# Setup ------------
let g:fsharp_only_check_errors_on_write = 1


"Register deoplete --------
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = "omnifunc"
let g:deoplete#max_abbr_width=120
let g:deoplete#max_menu_width=120
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

let startHour = strftime('%H')
if (startHour > 7) && (startHour < 16)
    :exec "colorscheme solarized"
endif
