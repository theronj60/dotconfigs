# zsh ========================
alias reloadzsh="source ~/.zshrc && echo 'Zsh Refreshed!'"
alias reloadtmux="tmux source ~/.tmux.conf && echo 'Tmux Refreshed!'"
alias reloadrice="source ~/.zshrc && tmux source ~/.tmux.conf && echo 'Setup Refreshed!'"
alias customzsh="cd ~/.oh-my-zsh/custom"

# system ========================
alias home="cd ~"
alias ks="clear"
alias la="ls -a"
alias laa="ls -la"
# Lock the screen (when going AFK)
alias afk="sleep 1 && pmset displaysleepnow"
alias :q="exit"
# when creating a sym link - original file -> target
alias createlink="ln -nfs "
alias bigsur="xcode-select --install"

# brew ========================
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'
# need to create docker instance for postpres at some point
alias startgres="brew services start postgresql"
alias stopgres="brew services stop postgresql"

# dev commands ========================
alias nrd="npm run dev"
alias watch="npm run watch"
alias pa="php artisan"
alias godot="nvim --listen godothost ."
alias dps="docker ps"
alias dpa="docker ps -a"
# workplace =======================
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# software ========================
# alias python="python3"
# alias py="python"
alias orby="orbctl"
alias vim="nvim"
alias vi="nvim"

# git ========================
alias g="git"
alias ga="git add ."
alias gc="git commit -m"
alias worktree="git worktree"
alias grpublic="git restore *public"
alias undocommit="git reset HEAD~1"
alias fetch="git fetch origin"
alias pullmaster="git pull origin master"
alias pullmain="git pull origin main"
alias pulldev="git pull origin dev"
alias clearbranches="git branch --merged | egrep -v \"(^\\*|master|production|main)\" | xargs git branch -d"

# tmux ========================
# attach requires a specified target
alias attach="tmux attach -t"
alias detach="tmux detach"
# alias tmuxdev="tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50" -- example

# key ======================== need to run keygen on new systems
alias getpub="cat ~/.ssh/id_ed25519.pub | pbcopy && echo 'Public Key copied to clipboard!'"

# Functions ========================

function build() {
	g++ --std=gnu++20 -o "$1" "$2.cpp"
}

# copy contents of a file
# ex. copy file-name
function copy() {
	cat "$@" | pbcopy && echo 'Copied '$@''
}

function startdock() {
	# docker function to start docker group instances
	docker start $(docker ps -a -q --filter "name="$1"") && echo '\n '$1' docker instances have been started.'
}

function stopdock() {
	# docker function to start docker group instances
	docker stop $(docker ps -a -q --filter "name="$1"") && echo '\n '$1' docker instances have been stopped.'
}

function tx() {
	if [ "$TERM_PROGRAM" = tmux ]; then
		if [ $# -eq 0 ]; then
			tmux new -d -s tmux && tmux switch -t tmux
		else
			tmux new -d -s "$@" && tmux switch -t "$@"
		fi
	else
		if [ $# -eq 0 ]; then
			tmux
		else
			tmux new -s "$@"
		fi
	fi
}

# playing with tmux popup
function readman() {
	tmux display-popup -E 'man '$@''
}

# workflow for git worktrees(for day job)
function setworktree() {
	# copy env
	cp ../master/.env .env
	npm install
	composer install
	tmux rename-window "$@"
	tmux split-window -h -p 33 -c "#{pane_current_path}"
	# passed in input would be branch number
	valet link "$@".nos
}
# function setworktree() {
	# copy env
	# cp ../master/.env .env
	# cp ../master/docker-compose.yml docker-compose.yml
	# tmux split-window -h -p 33 -c "#{pane_current_path}"
	# sail build
	# sail up
	# tmux split-window -v -p 50 -c "#{pane_current_path}"
	# composer require laravel/sail --dev
	# sail composer install && sail yarn install
	# tmux rename-window "$@"
	# passed in input would be branch number
# }

function removewt() {
	# passed in input would be branch number
	valet unlink
	cd ..
	# directory passed to remove
	git worktree remove "$@"
}

function startdev() {
	# cd "$@" && tmux rename-window laravel && tmux new-window -n watch && tmux select-window -t 0
	cd "$@" && tmux rename-window "$@" && tmux split-window -h -p 33 -c "#{pane_current_path}"
}

