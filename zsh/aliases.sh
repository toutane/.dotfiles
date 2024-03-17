#!/bin/zsh

#alias tree="tree -L 2"
alias gs="git status"
alias gl="git log --oneline"
alias ls="ls --color=auto"
# Only when on Debian
if [ -f /etc/debian_version ]; then
  alias bat="batcat"
fi
alias p="cat"
