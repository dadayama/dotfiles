#!/bin/bash

DOT_FILES=()
DOT_FILES=("${DOT_FILES[@]}" .gemrc)
DOT_FILES=("${DOT_FILES[@]}" .git_template)
DOT_FILES=("${DOT_FILES[@]}" .gitconfig)
DOT_FILES=("${DOT_FILES[@]}" .gitignore_global)
DOT_FILES=("${DOT_FILES[@]}" .vimrc)
DOT_FILES=("${DOT_FILES[@]}" .vimrc.basic)
DOT_FILES=("${DOT_FILES[@]}" .vimrc.bundle)
DOT_FILES=("${DOT_FILES[@]}" .vimrc.complement)
DOT_FILES=("${DOT_FILES[@]}" .vimrc.keybind)
DOT_FILES=("${DOT_FILES[@]}" .vimrc.plugins)
DOT_FILES=("${DOT_FILES[@]}" .vimrc.scripts)
DOT_FILES=("${DOT_FILES[@]}" .zprofile)
DOT_FILES=("${DOT_FILES[@]}" .zshenv)
DOT_FILES=("${DOT_FILES[@]}" .zshrc)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/.dotfiles/$file $HOME/$file
done

[ ! -d ~/.vim/dict ] mkdir -p ~/.vim/dict
DICT_FILES=()
DICT_FILES=("${DICT_FILES[@]}" javascript.dict)
DICT_FILES=("${DICT_FILES[@]}" perl.dict)
DICT_FILES=("${DICT_FILES[@]}" php.dict)
for file in ${DICT_FILES[@]}
do
  ln -s $HOME/.dotfiles/.vim/dict/$file $HOME/.vim/dict/$file
done

[ ! -d ~/.zsh/completion ] mkdir -p ~/.zsh/completion
ZSH_FILES=()
ZSH_FILES=("${ZSH_FILES[@]}" _git)
ZSH_FILES=("${ZSH_FILES[@]}" git-completion.bash)
for file in ${ZSH_FILES[@]}
do
  ln -s $HOME/.dotfiles/.zsh/completion/$file $HOME/.zsh/completion/$file
done

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'

source ~/.vimrc
