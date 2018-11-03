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
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

"" git
Plug 'airblade/vim-gitgutter'

"" complecation
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"" other
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'

"" language
Plug 'python-mode/python-mode', { 'branch': 'develop' }

call plug#end()

"" *****************************
"" vim config
"" *****************************
"" leader key
let mapleader = "\<Space>"

syntax on
color dracula


"" *****************************
"" keymap
"" *****************************
"" nerdtree
noremap <Leader>op :NERDTreeToggle<CR>

"" easy-align
noremap <Leader>ea :EasyAlign<CR>



"" *****************************
"" nerdtree config
"" *****************************
"" start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"" close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
let g:ale_fix_on_save = 1

"" language fixer
let g:ale_fixers = {'javascript': ['eslint'], 'python': ['flake8']}

"" symbols
let g:ale_sign_error='✖'
let g:ale_sign_warning='➤'
let g:ale_sign_info='Φ'

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
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)


"" *****************************
"" python config
"" *****************************
let g:pymode_python = 'python3'
