#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"

DOT_FILES=()
DOT_FILES=("${DOT_FILES[@]}" .gemrc)
DOT_FILES=("${DOT_FILES[@]}" .git_template)
DOT_FILES=("${DOT_FILES[@]}" .gitconfig)
DOT_FILES=("${DOT_FILES[@]}" .gitignore_global)
DOT_FILES=("${DOT_FILES[@]}" .tmux.conf)
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
  # /bin/rm -f $SCRIPT_DIR/$file
  rm $HOME/$file
  ln -s $SCRIPT_DIR/$file $HOME/$file
done

[ ! -d $HOME/.vim/dict ] && mkdir -p $HOME/.vim/dict
DICT_FILES=()
DICT_FILES=("${DICT_FILES[@]}" javascript.dict)
DICT_FILES=("${DICT_FILES[@]}" perl.dict)
DICT_FILES=("${DICT_FILES[@]}" php.dict)
for file in ${DICT_FILES[@]}
do
  ln -s $SCRIPT_DIR/.vim/dict/$file $HOME/.vim/dict/$file
done

[ ! -d $HOME/.zsh/completion ] && mkdir -p $HOME/.zsh/completion
ZSH_FILES=()
ZSH_FILES=("${ZSH_FILES[@]}" _git)
ZSH_FILES=("${ZSH_FILES[@]}" git-completion.bash)
for file in ${ZSH_FILES[@]}
do
  ln -s $SCRIPT_DIR/.zsh/completion/$file $HOME/.zsh/completion/$file
done

[ ! -d $HOME/.vim/bundle ] && mkdir -p $HOME/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'
