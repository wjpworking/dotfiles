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
endif

call plug#begin('~/.config/nvim/plugged')

" align
Plug 'junegunn/vim-easy-align'

" synatx lint
Plug 'w0rp/ale'

" theme
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }

" comment
Plug 'scrooloose/nerdcommenter'

" auto pair
"Plug 'jiangmiao/auto-pairs'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode'

" ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" Other
Plug 'luochen1990/rainbow'
Plug 'hecal3/vim-leader-guide'
Plug 'liuchengxu/vim-which-key'
Plug 'hotoo/pangu.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'wakatime/vim-wakatime'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'rhysd/vim-grammarous'

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
color dracula                     " neovim color theme setting

" mac backsoace setting
if has('mac')
    set backspace=2
endif

" *****************************
" ncm2 config
" *****************************
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" *****************************
" vim ariline config
" *****************************
let g:airline#extensions#tabline#enabled = 1

" *****************************
" ale config
" *****************************
let g:ale_linters =  {'javascript': ['eslint']}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" symbols
let g:ale_sign_error='✖'
let g:ale_sign_warning='➤'
let g:ale_sign_info='Φ'

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" git info
let g:airline#extensions#branch#enabled = 1

" keymap
nmap <silent> <Leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <Leader>an <Plug>(ale_next_wrap)

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
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

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
nmap <Leader>mpd <Plug>MarkdownPreviewStop<CR>

" *****************************
" vim witch key config
" *****************************
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" *****************************
" pangu config
" *****************************
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()