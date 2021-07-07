# zsh
alias reloadzsh="source ~/.zshrc && echo 'zsh refreshed!'"
alias customzsh="cd ~/.oh-my-zsh/custom"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc" 
alias aliasconfig="vim ~/dotconfigs/alias.zsh"

# system
alias home="cd ~"
alias cl="clear"
alias la="ls -a"
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'
# Lock the screen (when going AFK)
alias afk="sleep 1 && pmset displaysleepnow"
alias :q="exit"
# when creating a sym link - original file -> target
alias createlink="ln -nfs "
alias bigsur="xcode-select --install"

# dev commands
alias nrd="npm run dev"
alias watch="npm run watch"
alias pa="php artisan"

#software
alias python="python3"

# git
alias undocommit="git reset HEAD~1"
alias fetch="git fetch origin"
alias clearbranches="git branch --merged | egrep -v \"(^\\*|master|production)\" | xargs git branch -d"
