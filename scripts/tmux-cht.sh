#!/bin/bash

# thank you theprimeagen for providing this script
# updated with tmux popup

# update, bash scripts need to come from .local/bin
selected=`cat ~/dotconfigs/scripts/tmux-cht-languages ~/dotconfigs/scripts/tmux-cht-command | fzf-tmux -p 80%,60%`
if [[ -z $selected ]]; then
    exit 0
fi

# @TODO how can we open a tmux popup and save the query variable?
read -r -p 'Enter Query: ' query

if grep -qs "$selected" ~/dotconfigs/scripts/tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
	# switch neww with popup -E "{command}"
	tmux popup -h 80% -w 80% -E "curl -s cht.sh/$selected/$query | less -r"
    # tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
	tmux popup -h 80% -w 80% -E "curl -s cht.sh/$selected~$query/ | less -r"
    # tmux neww bash -c "curl -s cht.sh/$selected/$query | less"
fi
