# this file save custom keymap

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias sourcezsh="source ~/.zshrc"
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias dotfiles='nvim ~/.dotfiles'
alias ls="exa"
alias anniex="annie -x http://127.0.0.1:7890"
alias merge-video="rename ' ' '' * | find * | xargs -i echo file {} > temp.txt | ffmpeg -safe 0 -f concat -i temp.txt -c copy output.mp4; rm temp.txt"
