#!/bin/sh

# Determine git branch name.
function parse_git_branch (){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Determine the branch/state information for this git repository.
function set_git_branch () {
    branch=$(parse_git_branch)
    BRANCH="$branch "
}

# Determine if the remote repository has changed.
function compare_with_remote() {
    UPSTREAM=${1:-'@{u}'}
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse "$UPSTREAM" 2> /dev/null)
    BASE=$(git merge-base @ "$UPSTREAM" 2> /dev/null)
    STATE=""

    if [ -n "$REMOTE" ]; then
        if [ $LOCAL = $REMOTE ]; then
            #echo "Up-to-date"
            STATE=""
        elif [ $LOCAL = $BASE ]; then
            #echo "Need to pull"
            STATE=" ⇣ "
        elif [ $REMOTE = $BASE ]; then
            #echo "Need to push"
            STATE=" ⇡ "
        else
            #echo "Diverged"
            echo "2"
        fi
    fi
}

# Determine if repo is dirty.
function check_git_dirty() {
    if [ ! -z "$(command git status --porcelain -u${untracked_git_mode})" ]; then
        DIRTY_STATE="* "
    else
        DIRTY_STATE=""
    fi
}

# Set the full zsh prompt.
function set_prompt () {
    (git rev-parse 2> /dev/null)
    local is_inside_git_repo=$?
    if [[ $is_inside_git_repo -eq 0 ]]; then
        set_git_branch
        git show &> /dev/null
        if [ $? -ne 128 ]; then
            compare_with_remote
        fi
        check_git_dirty
        #prompt="%F{green}%n@%m%f:%F{blue}%~%f${BRANCH}%F{magenta}${DIRTY_STATE}%f%F{yellow}${STATE}%f$ "
        trans="\]\033[00m\]"
        magenta="\[\033[0;36m\]"
        purple="\[\033[0;35m\]"
        prompt="\[\033[01;32m\]toutane@epita\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[00m\]$magenta$BRANCH$purple$DIRTY_STATE$trans$STATE\$ "
    else
        #prompt="%F{green}%n@%m%f:%F{blue}%~%f$ "
        prompt="\[\033[01;32m\]toutane@epita\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[00m\]\$ "
    fi
    #export PS1="\[\033[01;32m\]toutane@epita\[\033[00m\]:\[\033[01;34m\]$wrapped_pwd\[\033[00m\]\[\033[00m\]\$ "
    export PS1="$prompt"
}

set_prompt
