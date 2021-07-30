# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
export PATH="/opt/homebrew/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/theronjoe/.oh-my-zsh"

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
	laravel
	web-search
	zsh-syntax-highlighting
	z
)

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Alias are being loaded from the /.oh-my-zsh/custom folder. 


