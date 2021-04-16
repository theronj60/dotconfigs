# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc

# Path to your oh-my-zsh installation.
export ZSH="/Users/theronjoe/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="typewritten"

export TYPEWRITTEN_SYMBOL="->"
export TYPEWRITTEN_PROMPT_LAYOUT="singleline"
export TYPEWRITTEN_RELATIVE_PATH="off"
export TYPEWRITTEN_COLORS="arrow:#266b85"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git laravel web-search zsh-syntax-highlighting z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Alias are being loaded from the /.oh-my-zsh/custom folder. 

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
