# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/idwangmo/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  osx
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# pipenv lang config
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
alias zshconfig="emacs ~/.zshrc"
alias ohmyzsh="emacs ~/.oh-my-zsh"
alias source-zsh="source ~/.zshrc"

# keymap
# brew
alias brew-update='brew update | brew upgrade |
    brew cask upgrade | brew cleanup'

# docker
alias docker-kill='docker kill $(docker ps -a -q)'
alias docker-clean-container='docker rm $(docker ps -a -q)'
alias docker-clean-image='docker rmi $(docker images -q -f dangling=true)'
alias docker-clean-all='dockercleanc | dockercleani | \
    docker rmi -f $(docker images -q)'

# other keymap
alias nvim-config='nvim $HOME/.vim/init.vim'

# miniconda config
export PATH=/usr/local/miniconda3/bin:$PATH

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# the fuck
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

# default editor
export EDITOR="emacs"

# doom config
export PATH=$PATH:$HOME/.emacs.d/bin

# brew config
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# yarn config
export PATH=$PATH:$HOME/.yarn/bin

# mysql config
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# sqlite3 config
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# go config
export PATH=$PATH:$HOME/go/bin

# gpg key
export GPG_TTY=$(tty)

# llvm config
export PATH="/usr/local/opt/llvm/bin:$PATH"

