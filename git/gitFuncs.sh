#!/bin/bash


# https://github.com/mfitzp/martinfitzpatrick.name/blob/master/content/computing/add-git-branch-name-to-terminal-prompt-mac.md
parse_git_branch() {

      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'

    }

function gwl(){
  Command="git branch --merged master | grep -v master "

  if [ "$1" == "d" ]; then
    Command+="| xargs -I % sh -c 'git branch -D %; git push origin --delete %;'"
  fi;

  eval "$Command && git fetch --prune origin"
}

if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
fi

alias gc="git checkout"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gp="git pull"
