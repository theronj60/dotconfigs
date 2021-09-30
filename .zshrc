# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
export PATH="/opt/homebrew/sbin:$PATH"
# Created by `pipx` on 2021-08-02 22:07:37
export PATH="$PATH:/Users/theronjoe/.local/bin"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Path to your oh-my-zsh installation.
export ZSH="/Users/theronjoe/.oh-my-zsh"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
export FZF_DEFAULT_OPTS="--layout=reverse --border"
export FZF_COMPLETION_OPTS="--layout=reverse --border"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--layout=reverse --border"
# get and configure bat for fzf preview

export EDITOR=nvim

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="typewritten"
# ZSH_THEME="daivasmara"
# ZSH_THEME="halil"

export TYPEWRITTEN_SYMBOL="->"
export TYPEWRITTEN_PROMPT_LAYOUT="singleline"
export TYPEWRITTEN_RELATIVE_PATH="home"
export TYPEWRITTEN_COLORS="arrow:#266b85"

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
