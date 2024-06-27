#!/bin/bash

# alacritty
# zsh shell
# add git
# check if "make" is availible
# check for gcc
# add tmux

# bin location
# $HOME/.local/bin
# link sh files to bin

# git

# nvm
#
#
# nvim

if [[ $OSTYPE == 'darwin'* ]]; then
	brew install git
	brew install --HEAD neovim echo 'macOS'
else
	add-apt-repository ppa:git-core/ppa &&\
	apt update &&\
	apt install git &&\
fi

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" &&\
	echo $DOTFILES

ln -nfs $DOTFILES/.zshrc $HOME/.zshrc
ln -nfs $DOTFILES/.tmux.conf $HOME/.tmux.conf

ln -nfs $DOTFILES/.fzf.zsh $HOME/.fzf.zsh
ln -nfs $DOTFILES/alias.zsh $HOME/.oh-my-zsh/custom/alias.zsh

rm -rf $HOME/.config/nvim
ln -nfs $DOTFILES/.config/nvim $HOME/.config/nvim

rm -rf $HOME/.config/alacritty
ln -nfs $DOTFILES/.config/alacritty $HOME/.config/alacritty

mkdir -p $HOME/.local/bin

ln -nfs $DOTFILES/scripts/kasm-setup.sh $HOME/.local/bin/kasm-setup.sh
ln -nfs $DOTFILES/scripts/tmux-sessionizer.sh $HOME/.local/bin/tmux-sessionizer.sh
ln -nfs $DOTFILES/scripts/tmux-cht.sh $HOME/.local/bin/tmux-cht.sh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
