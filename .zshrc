# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
# Created by `pipx` on 2021-08-02 22:07:37
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/usr/local/go/bin"

if [[ $OSTYPE == 'darwin'* ]]; then
	export PATH="/opt/homebrew/bin:$PATH"
	export PATH="/opt/homebrew/sbin:$PATH"
	# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -lunwind"
	export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/unwind -lunwind"

	export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
	export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
	export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
	eval "$(rbenv init - zsh)"
fi

path+="$HOME/Library/Python/3.9/bin"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ulimit -S -n 4096

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
# export FZF_DEFAULT_OPTS="--layout=reverse --border"
# export FZF_COMPLETION_OPTS="--layout=reverse --border"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_CTRL_T_OPTS="--layout=reverse --border"
# get and configure bat for fzf preview

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

fpath=($fpath "$HOME/.zfunctions")

# Set typewritten ZSH as a prompt
autoload -U promptinit; promptinit
prompt typewritten

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
	. "/opt/anaconda3/etc/profile.d/conda.sh"
else
	export PATH="/opt/anaconda3/bin:$PATH"
fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/theronjoe/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/theronjoe/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/theronjoe/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/theronjoe/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
