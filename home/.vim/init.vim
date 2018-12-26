"" *****************************
"" init setting
"" *****************************
if has('vim_starting')
  set nocompatible
  set encoding=utf-8
  set backspace=2 " mac backspace setting
endif

"" *****************************
"" vim-plug settig
"" *****************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "Please install curl"
    execute "q!"
  endif
  echo "Installing Vim-plug"
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github\
  usercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"" down vim plugin
call plug#begin("~/.vim/plugged")

"" git
Plug 'tpope/vim-fugitive'

"" nerdtree
Plug 'scrooloose/nerdtree'

"" theme
Plug 'dracula/vim', { 'as': 'dracula' }

"" airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" synatx
Plug 'w0rp/ale'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"" git
Plug 'airblade/vim-gitgutter'

"" complecation
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"" markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

"" vim-orgmode
Plug 'jceb/vim-orgmode'

"" mustache
Plug 'mustache/vim-mustache-handlebars'

"" other
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
" Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'hecal3/vim-leader-guide'
Plug 'simnalamburt/vim-mundo'
Plug 'majutsushi/tagbar'
Plug 'hotoo/pangu.vim'

call plug#end()

"" *****************************
"" vim config
"" *****************************
"" leader key
let mapleader = "\<Space>"

set number

syntax on
set ruler
set number
set mouse=a
set hidden

color dracula

set cursorline

"" file encoding
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" ignore warning bell
set noerrorbells
set novisualbell
set t_vb=

filetype indent plugin on

"" Tab = 4
set tabstop=4
set shiftwidth=4
set sta
set et
set sts=4

set colorcolumn=80

set clipboard=unnamed

"" *****************************
"" keymap
"" *****************************
"" nerdtree
noremap <Leader>op :NERDTreeToggle<CR>

"" easy-align
noremap <Leader>ea :EasyAlign<CR>

"" lsp config
nnoremap <Leader>ls :call LanguageClient_contextMenu()<CR>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"" *****************************
"" nerdtree config
"" *****************************
"" start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
    \ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"" close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree()) | q | endif

"" symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"" *****************************
"" vim-airline config
"" *****************************
"" theme
let g:airline_theme='dracula'

"" tabline
let g:airline#extensions#tabline#enabled = 1

"" *****************************
"" ale coanfig
"" *****************************
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1

"" language linters
let g:ale_linters = {
    \'javascript': ['eslint'],
    \'python': ['flake8']
    \}

"" language fixer
let g:ale_fixers = {
    \'javascript': ['eslint'],
    \'python': ['yapf', 'isort']
    \}

"" symbols
let g:ale_sign_error='✖'
let g:ale_sign_warning='➤'
let g:ale_sign_info='Φ'

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"" git info
let g:airline#extensions#branch#enabled = 1

"" ale extensions
let g:airline#extensions#ale#enabled = 1

"" font size
let g:ale_list_window_size = 5

"" *****************************
"" deoplete config
"" *****************************
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

"" auto close preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)

"" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])


"" *****************************
"" language server config
"" *****************************
let g:LanguageClient_serverCommands = {
    \ 'python': ['/bin/pyls', '--log-file=/tmp/pyls.log'],
    \ 'vue': ['vls']
    \ }

set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()
