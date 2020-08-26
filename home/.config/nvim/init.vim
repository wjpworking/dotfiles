"  _     _
" (_) __| |_      ____ _ _ __   __ _ _ __ ___   ___
" | |/ _` \ \ /\ / / _` | '_ \ / _` | '_ ` _ \ / _ \
" | | (_| |\ V  V / (_| | | | | (_| | | | | | | (_) |
" |_|\__,_| \_/\_/ \__,_|_| |_|\__, |_| |_| |_|\___/
"                              |___/
"                        _
"  _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"

" *****************************
" vim-plug settig
" *****************************
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    echo "Installing Vim-plug"
    echo ""
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
if has('nvim')
  set shada+=n~/.nvim/shada
else
  set viminfo+=n~/.vim/viminfo
endif

" This is only present in 7.3+ {{{3
if exists('+undofile')
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif


call plug#begin('~/.config/nvim/plugged')

" align
Plug 'junegunn/vim-easy-align'

" theme
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'edkolev/tmuxline.vim'

" comment
Plug 'scrooloose/nerdcommenter'

" indent
Plug 'Yggdroot/indentLine'

" windows
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'

" snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" undo tree
Plug 'simnalamburt/vim-mundo'

" git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-markdown'
Plug 'dkarter/bullets.vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Other
Plug 'luochen1990/rainbow'
Plug 'hotoo/pangu.vim'
Plug 'sgur/vim-editorconfig'
" Plug 'wakatime/vim-wakatime'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rhysd/vim-grammarous'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim'

call plug#end()

" *****************************
" neovim base config
" *****************************
filetype plugin indent on         " Load plugins according to detected filetype.
syntax on                         " Enable syntax highlighting.

set autoindent                    " Indent according to previous line.
set expandtab                     " Use spacces instead of tabls.
set softtabstop =4                " Tabl key indents by 4 spacces.
set shiftwidth  =4                " >> indents by 4 spaces.
set shiftround                    " >> indents to next multiple of 'shiftwidth'

set backspace   =indent,eol,start " Make backspace work as you would expect.
set hidden                        " Switch between buffers without having to save first.

set showmode                      " Show current mode in command-line
set showcmd                       " Show already typed keys when more are expected.

set incsearch                     " Highlight while searching with / or ?.
set hlsearch                      " Keep matches highlighted.

set ttyfast                       " Faster redrawing.
set lazyredraw                    " Only redraw when necessary.

set splitbelow                    " Open new windows below the current window.
set splitright                    " Open new windows right of the current window.

set cursorline                    " Find the current line quickly.
set wrapscan                      " Searches wrap around end-of-file.
set report      =0                " Always report changed lines.
set synmaxcol   =200              " Only highlight the first 200 columns.
set number                        " line number
set wrap                          " auto wrap line

set list                          " Show non-printabe characters.
set smartcase                     " auto cast case
let mapleader="\<Space>"          " leader key
color onedark                     " neovim color theme setting
set clipboard+=unnamedplus

" mac backsoace setting
if has('mac')
    set backspace=2
endif

" *****************************
" vim ariline config
" *****************************
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" *****************************
" easy align config
" *****************************
noremap <Leader>ea :EasyAlign<CR>

" *****************************
" nerdcommenter config
" *****************************
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" *****************************
" NERDTree config
" *****************************
" auto close whem neovom close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree open keymap
map <Leader>op :NERDTreeToggle<CR>

" *****************************
" easymotion config
" *****************************
map  <Leader>e <Plug>(easymotion-sn)
omap <Leader>e <Plug>(easymotion-tn)

" *****************************
" ultisnips
" *****************************
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" *****************************
" vim-mundo config
" *****************************
nnoremap <Leader>ud :MundoToggle<CR>

" *****************************
" git message config
" *****************************
nmap <Leader>gm <Plug>(git-messenger)

" *****************************
" markdown config
" *****************************
nmap <Leader>mp <Plug>MarkdownPreview
nmap <Leader>md <Plug>MarkdownPreviewStop<CR>
let g:markdown_fenced_languages = ['css', 'js=javascript']

" *****************************
" pangu config
" *****************************
autocmd BufWritePre text,*.wiki,*.cnx call PanGuSpacing()

" *****************************
" coc config
" *****************************
let g:coc_global_extensions = ['coc-python', 'coc-dictionary', 'coc-markdownlint']
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" *****************************
" prettier config
" *****************************
nmap <Leader>pr <Plug>(Prettier)
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" *****************************
" other config
" *****************************
" Open a terminal window
map <LEADER>sh :set splitbelow<CR>:sp<CR>:term<CR>
nmap <Leader>bn :bNext<CR>
let g:onedark_terminal_italics = 1

" *****************************
" carbon setting
" *****************************
" let g:carbon_now_sh_browser = 'google-chrome'
vnoremap <Leader>cr :CarbonNowSh<CR>
let g:carbon_now_sh_options =
    \ { 'ln': 'true',
    \   'fm': 'Iosevka' }
