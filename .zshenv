fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit

bindkey -e

# direnv setting
export EDITOR="vim"
eval "$(direnv hook bash)"

# Hub setting
eval "$(hub alias -s)"

# Ruby gem variable
export RB_USER_INSTALL=true 

# Homebrew-cask variable
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

# Java variable
export JAVA_HOME="/usr/libexec/java_home"

# For .vimrc
stty -ixon

# AWS setting
# complete -C aws_completer aws
export AWS_IAM_HOME="/usr/local/Cellar/aws-iam-tools/1.5.0/libexec"

# Homebrew setting
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Perl plenv setting
if [ -d ${HOME}/.plenv ] ; then
  export PATH="$HOME/.plenv/bin:$HOME/.plenv/shims:$PATH"
  # export PATH="./local/lib:$PATH"
  eval "$(plenv init -)"
fi

# PHP phpenv setting
if [ -d ${HOME}/.phpenv ] ; then
  export PATH="$HOME/.phpenv/bin:$PATH"
  eval "$(phpenv init -)"
fi

# Ruby rbenv setting
if [ -d ${HOME}/.rbenv ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="./vendor/bin:$PATH"
  eval "$(rbenv init -)"
  export CC=/usr/bin/gcc
fi

# Node.js setting
if [ -d ${HOME}/.nodebrew ] ; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

# AWS Elastic Beanstalk setting
if [ -d ${HOME}/.eb ] ; then
  export PATH="$HOME/.eb/eb/macosx/python2.7:$PATH"
fi
