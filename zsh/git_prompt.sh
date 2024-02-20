#!/bin/zsh

grey="%F{8}"

git_branch() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ ! -z "${BRANCH}" ]
  then
    echo "${grey}${BRANCH}%f"
  fi
}

git_dirty() {
  if [ -n "$(git status --porcelain)" ]
  then
    echo "${grey}*%f"
  fi
}

git_compare_remote() {
  UPSTREAM=${1:-'@{u}'}
  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse "$UPSTREAM")
  BASE=$(git merge-base @ "$UPSTREAM")

  if [ $LOCAL = $REMOTE ]
  then
    # Up-to-date
    # STATUS="${blue}⇅%f"
  elif [ $LOCAL = $BASE ]
  then
    # Need to pull
    echo " %F{yellow}↓%f"
  elif [ $REMOTE = $BASE ]
  then
    # Need to push
    echo " %F{blue}↑%f"
  else
    # Diverged
    echo " %F{purple}↕%f"
  fi
}

git_prompt() {
  # Check if we are in a git repo
  if $(git rev-parse --is-inside-work-tree &> /dev/null); then
    echo " $(git_branch)$(git_dirty)$(git_compare_remote) "
  fi
}
