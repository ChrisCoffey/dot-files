############
#
#  Config Variables
#
###########
ulimit -n 4096

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

export PROMPT="%n %T $(git_branch_name) %d λ"

alias ..="cd .."
alias ...=".. && .."
alias ....=".. && ..."
alias ll="ls -alh"
alias ws="cd ~/workspace"
alias wsp="cd ~/workspace/personal"
alias wso="cd ~/workspace/open_source"
alias wsv="cd ~/.local/share/nvim/plugged"
alias wscv="cd ~/workspace/college_vine"
alias rmorig='find ./ -name "*.orig" -delete'

##########################
### Haskell Aliases   ####
##########################
alias hb="stack build --fast --test --no-run-tests"
alias hbd="stack build --fast --haddock --no-haddock-deps --haddock-internal"
alias hbt="stack build --test --no-run-tests --fast"
alias sghci="stack ghci"
alias sghc="stack ghc"
alias hdevtools='stack exec --no-ghc-package-path --package hdevtools hdevtools --'
alias sghci-core="stack ghci --ghci-options -ddump-simpl \
     --ghci-options -dsuppress-idinfo \
     --ghci-options -dsuppress-coercions \
     --ghci-options -dsuppress-type-applications \
     --ghci-options -dsuppress-uniques \
     --ghci-options -dsuppress-module-prefixes"

##########################
### Purescript Aliases ###
##########################
alias pb="yarn run pulp build"
alias pr="yarn run start"

#########################
### Path Variables    ###
#########################
export WS="/workspace"
export NVM_HOME="$HOME/.nvm"

export PATH=/bin:$PATH
export PATH=$PATH:/bin/s3cmd-1.5.0-rc1
export PATH=~/.local/bin:$PATH

## Ensure programs installed by brew are given preference, unless otherwise specified
export PATH=/opt/homebrew:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export LDFLAGS="-L/usr/local/opt/llvm/lib:$LDFLAGS"

########################
### Git              ###
########################

export PATH=$PATH:/bin/bootScripts/git/
# source ~/bin/bootScripts/git/gitFuncs.sh
export REVIEW_BASE=master # Used in some git aliases

########################
### Node             ###
########################
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


########################
### Ruby             ###
########################
# Add 'rbenv' to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
alias be="bundle exec"
alias bo="BUNDLER_EDITOR=nvim bundler open "
alias nuke="bundle exec rake db:drop db:create db:migrate "

#######################
### Elixer          ###
#######################
export PATH="$HOME/.kiex/bin:$PATH"
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

########################
### ShUnit           ###
########################
export SHUNIT_HOME=~/workspace/open_source/shunit2

########################
### Helper Scripts   ###
########################

# Hook direnv into the shell
eval "$(direnv hook zsh)"

# Helper to recursively search for strings within files, perhaps with a specific extension.
# I find myself running this all the time to track down function usages
function rgrep {
    if [ $# -lt 2 ]; then
        echo "Requires at least two arguments"
        return 1
    elif  [ $# -gt 3 ]; then
        echo "Too many arguments provided. Only supports 3."
        return 1
    fi

    local term=$1
    local path=$2
    local file_extension=$3

    if [ -z "$file_extension" ]; then
        grep -rn "$term" "$path"
    else
        grep -rn "$term" --include="$file_extension" "$path"
    fi
}

function mdToPDF {
  base_file=$(echo "$1" | cut -f 1 -d ".")
  pandoc --from=markdown --to=pdf "$base_file.md" > "$base_file.pdf"
}

. "$HOME/.ghcup/env"
# . "$HOME/.cargo/env"

nvm use v16.15.0
