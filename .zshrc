# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
export PATH="/opt/homebrew/sbin:$PATH"
# Created by `pipx` on 2021-08-02 22:07:37
export PATH="$PATH:$HOME/.local/bin"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

path+="$HOME/Library/Python/3.9/bin"
# Path to your oh-my-zsh installation.
export ZSH="/Users/theronjoe/.oh-my-zsh"
eval "$(rbenv init - zsh)"

ulimit -S -n 4096

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
# export FZF_DEFAULT_OPTS="--layout=reverse --border"
# export FZF_COMPLETION_OPTS="--layout=reverse --border"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_CTRL_T_OPTS="--layout=reverse --border"
# get and configure bat for fzf preview

[ -f ~/.jira.zsh ] && source ~/.jira.zsh
export EDITOR=nvim

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="typewritten"
# ZSH_THEME="daivasmara"
# ZSH_THEME="halil"

export TYPEWRITTEN_SYMBOL="->"
export TYPEWRITTEN_PROMPT_LAYOUT="multiline"
export TYPEWRITTEN_RELATIVE_PATH="home"
export TYPEWRITTEN_COLORS="arrow:#266b85;host:#39d4ba;user:magenta;host_user_connector:yellow"
#39d4ba
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
	web-search
	zsh-syntax-highlighting
	z
)

ZSH_WEB_SEARCH_ENGINES=(
	reddit "https://www.reddit.com/search/?q="
	brand-icon "https://simpleicons.org/?q="
)

# Add colors to Terminal
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Alias are being loaded from the /.oh-my-zsh/custom folder. 

fpath=($fpath "/Users/theronjoe/.zfunctions")

# Set typewritten ZSH as a prompt
autoload -U promptinit; promptinit
prompt typewritten

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# needs to handle error @TODO
if [ -f *.py  ]; then
	__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
			. "/opt/anaconda3/etc/profile.d/conda.sh"
		else
			export PATH="/opt/anaconda3/bin:$PATH"
		fi
	fi
	unset __conda_setup
fi
# <<< conda initialize <<<

