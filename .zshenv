export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit

bindkey -e

# .vimrc
stty -ixon

# zsh-history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# direnv
export EDITOR="vim"
eval "$(direnv hook zsh)"

# hub
eval "$(hub alias -s)"

# gem
export RB_USER_INSTALL=true

# java
export JAVA_HOME=$(/usr/libexec/java_home)

# plenv
if [ -d ${HOME}/.plenv ] ; then
  export PATH="$HOME/.plenv/bin:$HOME/.plenv/shims:$PATH"
  # export PATH="./local/lib:$PATH"
  eval "$(plenv init -)"
fi

# pyenv
if [ -d ${HOME}/.pyenv ] ; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
fi

# phpenv
if [ -d ${HOME}/.phpenv ] ; then
  export PATH="$HOME/.phpenv/bin:$PATH"
  eval "$(phpenv init -)"
fi

# rbenv
if [ -d ${HOME}/.rbenv ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="./vendor/bin:$PATH"
  eval "$(rbenv init -)"
  export CC=/usr/bin/gcc
fi

# node
if [ -d ${HOME}/.nodebrew ] ; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
  export PATH="./node_modules/.bin:$PATH"
fi

# go
if [ -d ${HOME}/go ] ; then
  export GOPATH=$HOME/go
  export PATH="$GOPATH/bin:$PATH"
fi
