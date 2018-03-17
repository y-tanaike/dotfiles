#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"

DOT_FILES=(.bashrc .bash_profile .zshrc .tcshrc .vimrc _vimrc .vim .gitignore_global .ideavimrc .gitk .gvimrc)

for file in ${DOT_FILES[@]}
do
    ln -s ${DOT_DIRECTORY}/$file $HOME/$file
done

# install oh-my-zsh => 今はZsh + Prezto の法が良いかも(https://dev.classmethod.jp/tool/zsh-prezto/)
#[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
