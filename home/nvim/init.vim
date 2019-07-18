filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent " Indent according to previous line.
set expandtab " Use spacces instead of tabls.
set softtabstop =4 " Tabl key indents by 4 spacces.
set shiftwidth =4 " >> indents by 4 spaces.
set shiftround " >> indents to next multiple of 'shiftwidth'

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden " Switch between buffers without having to save first.

set showmode " Show current mode in command-line
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
set number  " line number
set wrap  " auto wrap line

set list " Show non-printabe characters.
set smartcase " auto cast case

" mac backsoace setting
if has('mac')
    set backspace=2
endif

"" *****************************
"" vim-plug settig
"" *****************************
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" vim airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

call plug#end()

" *****************************
" vim easy align
" *****************************
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
