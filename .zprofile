# -------------------------
#  * tmux setting *
# -------------------------
# is_screen_running() {
#   [ ! -z "$WINDOW" ]
# }
# is_tmux_runnning() {
#   [ ! -z "$TMUX" ]
# }
# is_screen_or_tmux_running() {
#   is_screen_running || is_tmux_runnning
# }
# shell_has_started_interactively() {
#   [ ! -z "$PS1" ]
# }
# resolve_alias() {
#   cmd="$1"
#   while \
#     whence "$cmd" >/dev/null 2>/dev/null \
#     && [ "$(whence "$cmd")" != "$cmd" ]
# do
#   cmd=$(whence "$cmd")
# done
# echo "$cmd"
# }
# if ! is_screen_or_tmux_running && shell_has_started_interactively; then
#   for cmd in tmux tscreen screen; do
#     if whence $cmd >/dev/null 2>/dev/null; then
#       $(resolve_alias "$cmd")
#       break
#     fi
#   done
# fi
if [ "$TMUX" = "" ]; then
  # tm attach;

  if [ $? ]; then
    tmux -2 new-session \; source-file ~/.tmux/new-session
  fi
fi


# -------------------------
#  * prompt setting *
# -------------------------
autoload -Uz vcs_info
autoload -Uz colors
vcs_info
colors
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
setopt prompt_subst
function vcs_echo {
  local st branch color
  STY= LANG=en_US.UTF-8 vcs_info
  st=`git status 2> /dev/null`
  if [[ -z "$st" ]]; then return; fi
  branch="$vcs_info_msg_0_"
  if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[magenta]} #staged
  elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
  elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[cyan]} # untracked
  else color=${fg[blue]}
  fi
  echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}
PROMPT='
%F{white}[%~]%f `vcs_echo`
%(?.$.%F{red}$%f) '


# -------------------------
#  * alias setting *
# -------------------------

# basic
alias src='source ~/.zshrc'
alias ls='ls -GF'

# tmux
alias tm='tmux -2'
# if [ $SHLVL = 1 ]; then
#   alias tm="tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session"
# fi
# alias tma='tmux a'
# alias tmat='tmux a -t'
# alias tmn='tmux new -s'
alias tmkl='tmux kill-session -t'
alias tms='tmux source-file ~/.tmux.conf'

# vagrant
alias vg='vagrant'

# ruby bundle
alias be='bundle exec'

# perl plenv
alias pe='plenv exec'
# perl carton
alias ce='carton exec'

# -------------------------
#  * command setting *
# -------------------------

# make command pushd / popd
setopt AUTO_PUSHD
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias pd='popd'
setopt PUSHD_IGNORE_DUPS

# override command rm
rm() {
  if [ -d ~/.trash ]; then
    local DATE=`date "+%y%m%d-%H%M%S"`
    mkdir ~/.trash/$DATE
    for i in $@; do
      if [ -e $i ]; then
        mv $i ~/.trash/$DATE/
      else 
        echo "$i : not found"
      fi
    done
  else
    /bin/rm $@
  fi
}
