#!/bin/zsh

grey="%F{8}"

git_branch() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ ! -z "${BRANCH}" ]
  then
    echo " ${grey}${BRANCH}%f "
  fi
}
