set mouse=a

let g:python3_host_prog = '/opt/homebrew/bin/python3'
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
" Plug 'airblade/vim-gitgutter'
Plug 'Shougo/vimproc.vim'
Plug 'jceb/vim-orgmode'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdtree'
Plug 'mtth/scratch.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rizzatti/dash.vim'
Plug 'junegunn/fzf'
Plug 'altercation/vim-colors-solarized'
Plug 'overcache/NeoSolarized'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'kien/rainbow_parentheses.vim'
Plug 'github/copilot.vim', {'branch': 'release'}

" LSP stuff
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"Consider whether this ^^ still makes sense

" Completion
"framework:
Plug 'hrsh7th/nvim-cmp'
" LSP completion source:
Plug 'hrsh7th/cmp-nvim-lsp'
"Other useful completion sources:
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'


" Haskell
" Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

" Elixir
Plug 'elixir-editors/vim-elixir'

" Purescript
Plug 'purescript-contrib/purescript-vim'

" Scala
Plug 'derekwyatt/vim-sbt'
" Plug 'ensime/ensime-vim'

" F#
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}

" Python
Plug 'klen/python-mode'

" Javascript
" Plug 'wookiehangover/jshint.vim'
"Plug 'Quramy/tsuquyomi'
"Plug 'leafgarland/typescript-vim'
"Plug 'mxw/vim-jsx'
"Plug 'pangloss/vim-javascript'

" Rust
" Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'


call plug#end()
"

" Basic nav and setup -------
let mapleader = "-"
let maplocalleader= "\\"
filetype plugin indent on
syntax on
set cmdheight=2

let g:scratch_horizontal=0
set updatetime=250
set shortmess+=c

set spelllang=en_us
set number numberwidth=2
set tags=./.tags,.tags,./tags,tags;/
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab shiftround
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
com! FormatJSON %!python3 -m json.tool

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


" GitGutter setup

"

" LanguageClient Setup
set hidden
" let g:ale_elixir_elixir_ls_release = '/Users/chriscoffey/workspace/open_source/elixir-ls/rel'

let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
let g:LanguageClient_selectionUI = 'location-list'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['pyls'],
    \ 'elixir': ['~/workspace/open_source/elixir-ls/rel/language_server.sh'],
    \ 'ruby': ['tcp://localhost:7658']
    \ }

nnoremap <localleader>f :call LanguageClient_textDocument_hover()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

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
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END
"

" Haskell Setup -------
let g:haddock_browser="open"
let g:haddock_browser_callformat="%s %s"
augroup haskellGrp
    autocmd!
augroup END
"

" Purescript Setup ------
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
command! -nargs=0 Prettier :CocCommand prettier.formatFile

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
    au FileType ruby setlocal fdm=syntax
augroup END

"

" Markdown Setup -------
augroup markdownGrp
    autocmd!
    au FileType markdown set spell wrap linebreak
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

"
" COC autocomplete config
"

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: There's always complete item selected by default, you may want to enable
"" no select by `"suggest.noselect": true` in your configuration file.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
"" Make <CR> to accept selected completion item or notify coc.nvim to format
"" <C-g>u breaks current undo, please make your own choice.
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif
"
"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call ShowDocumentation()<CR>
"
"function! ShowDocumentation()
"  if CocAction('hasProvider', 'hover')
"    call CocActionAsync('doHover')
"  else
"    call feedkeys('K', 'in')
"  endif
"endfunction
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Run the Code Lens action on the current line.
"nmap <leader>cl  <Plug>(coc-codelens-action)
"
"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)
"
"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif
"
"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocActionAsync('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
"
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Markdown preview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }


" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

function! GrepWordUnderCursor()
    " Save the current word under the cursor
    let current_word = expand('<cword>')

    " Get the file extension of the current buffer
    let current_ext = expand('%:e')

    " Use grep to search for the word in files with the same extension, and populate the quickfix list
    execute 'grep -rn --include="*.' . current_ext . '" ' . shellescape(current_word) . ' .'

    " Open the quickfix window to display the results
    copen
endfunction

" Optional: create a mapping to call the function, for example with <leader>g
nnoremap <leader>g :call GrepWordUnderCursor()<CR>


set termguicolors
set background=dark
colorscheme NeoSolarized
let startHour = strftime('%H')
if (startHour > 7) && (startHour < 16)
    :exec "set background=light"
endif

" Make sure the config file is symlinked from dot-files into this directory
lua require('config')
