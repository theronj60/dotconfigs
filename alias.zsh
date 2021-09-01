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
alias clearbranches="git branch --merged | egrep -v \"(^\\*|master|production|main|dev)\" | xargs git branch -d"

# tmux ======================== 
alias rustdev="tmux rename-session rust"
alias pydev="tmux rename-session python"
alias cdev="tmux rename-session cpp"
# attach requires a specified target
alias attach="tmux attach -t"
alias detach="tmux detach"
# the below commands only run while tmux is running
alias laradev="tmux rename-session laravel && tmux rename-window code && tmux new-window -n watch"
alias jsdev="tmux rename-session javascript && tmux rename-window code && tmux new-window -n npm"
# alias tmuxdev="tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50" -- example

# key ======================== 
alias getpub="cat ~/.ssh/id_ed25519.pub | pbcopy && echo 'Public Key copied to clipboard!'"

# Functions ========================

# copy contents of a file
# ex. copy file-name
function copy() {
	cat "$@" | pbcopy
}
# pbpaste -> paste
# can pipe into file
# ex.
# pbpaste > text.txt
# add function for running .py and .rs files also .cpp
# add function to open mux with arguments(laravel, js, rust)


