# local sofware bin
export PATH="$PATH:$HOME/.local/bin"

# emacs config
export PATH="$PATH:$HOME/.emacs.d/bin"

# yarn config
export PATH="$PATH:$HOME/.yarn/bin"

# rust config
export PATH="$PATH:$HOME/.cargo/bin"

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# go config
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# golangx proxy
export GOPROXY=https://goproxy.io

