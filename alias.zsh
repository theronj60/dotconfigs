# zsh ======================== 
alias reloadzsh="source ~/.zshrc && echo  $'\e]9;zsh refreshed!\007'"
alias customzsh="cd ~/.oh-my-zsh/custom"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc" 
alias aliasconfig="vim ~/dotconfigs/alias.zsh"

# system ======================== 
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

# dev commands ======================== 
alias nrd="npm run dev"
alias watch="npm run watch"
alias pa="php artisan"
alias php7="brew-php-switcher 7.4"
alias php8="brew-php-switcher 8.0"

# software ======================== 
alias python="python3"
alias rustmux="tmux new -s rust-vim"

# git ======================== 
alias ga="git add ."
alias gm="git commit -m"
alias undocommit="git reset HEAD~1"
alias fetch="git fetch origin"
alias pullmaster="git pull origin master"
alias clearbranches="git branch --merged | egrep -v \"(^\\*|master|production)\" | xargs git branch -d"

# vim ========================
alias pathogen="cd ~/.vim/bundle && git clone"

# tmux ======================== 
alias attach="tmux attach -t"

# key ======================== 
alias getpub="cat ~/.ssh/id_ed25519.pub | pbcopy && echo 'Public Key copied to clipboard!'"

# Functions ======================== 
function copy() {
	cat "$@" | pbcopy
}
