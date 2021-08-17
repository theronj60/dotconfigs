# zsh ======================== 
alias reloadzsh="source ~/.zshrc && echo 'Zsh Refreshed!'"
alias reloadtmux="tmux source ~/.tmux.conf && echo 'Tmux Refreshed!'"
alias customzsh="cd ~/.oh-my-zsh/custom"
alias zshconfig="vim ~/.zshrc"
alias tmuxconfig="vim ~/.tmux.conf"
alias vimconfig="vim ~/.config/nvim/init.vim" 
alias plugconfig="vim ~/.config/nvim/plug.vim"
alias aliasconfig="vim ~/dotconfigs/alias.zsh"

# system ======================== 
alias home="cd ~"
alias cl="clear"
alias la="ls -a"
# Lock the screen (when going AFK)
alias afk="sleep 1 && pmset displaysleepnow"
alias :q="exit"
# when creating a sym link - original file -> target
alias createlink="ln -nfs "
alias bigsur="xcode-select --install"

# brew ======================== 
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'
alias startgres="brew services start postgresql"
alias stopgres="brew services stop postgresql"

# dev commands ======================== 
alias nrd="npm run dev"
alias watch="npm run watch"
alias pa="php artisan"
alias php7="brew-php-switcher 7.4"
alias php8="brew-php-switcher 8.0"

# software ======================== 
alias python="python3"
alias vim="nvim"

# git ======================== 
alias g="git"
alias ga="git add ."
alias gc="git commit -m"
alias grpublic="git restore *public"
alias undocommit="git reset HEAD~1"
alias fetch="git fetch origin"
alias pullmaster="git pull origin master"
alias pullmain="git pull origin main"
alias pulldev="git pull origin dev"
alias clearbranches="git branch --merged | egrep -v \"(^\\*|master|production)\" | xargs git branch -d"

# vim ========================

# tmux ======================== 
alias rustmux="tmux new -s rust-vim"
alias attach="tmux attach -t"
# the below commands only run while tmux is running
# alias start="tmux split-window -v -p 30 && tmux split-window -h -p 50"
alias dev="tmux rename-session dev && tmux split-window -v -p 30"
alias tmuxdev="tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50" 

# key ======================== 
alias getpub="cat ~/.ssh/id_ed25519.pub | pbcopy && echo 'Public Key copied to clipboard!'"

# Functions ========================
# copy contents of a file
function copy() {
	cat "$@" | pbcopy
}
# add function for running .py and .rs files also .cpp
