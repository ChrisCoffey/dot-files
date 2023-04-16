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
alias wsl="cd ~/workspace/leaf"
alias wsp="cd ~/workspace/personal"
alias wso="cd ~/workspace/open_source"
alias wsc="cd ~/workspace/consulting"
alias wsrk="cd ~/workspace/consulting/rk"
alias wspr="cd ~/workspace/proxy"
alias wsr="cd ~/workspace/roundtown"
alias wsi="cd ~/workspace/consulting/inmoji"
alias wscv="cd ~/workspace/college_vine"
alias wsv="cd ~/.config/nvim/plugged"
alias 3p="cd ~/3rdParty"
alias sbt13="~/3rdParty/sbt_13.5/bin/sbt"
alias play="~/3rdParty/play-2.2.3/play"
alias activator="~/3rdParty/activator-1.2.3-minimal/activator"
alias clearsbt='export SBT_OPTS=""'
alias sparkNotebook='(~/bin/spark-notebook-0.6.1-scala-2.10.4-spark-1.5.0-hadoop-2.2.0/bin/spark-notebook)'
alias shapeless="~/bin/bootScripts/shapeless.sh"
alias fs2="~/bin/bootScripts/fs2.sh"
alias szs="~/bin/bootScripts/scalazS.sh"
alias genny="/Applications/Genymotion\ Shell.app/Contents/MacOS/gennyshell"
alias rmorig='find ./ -name "*.orig" -delete'
alias hdc='killall hdevtools'
alias dpj='git checkout -- **/purs/package-lock.json'

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
### Postgres          ###
#########################
export PATH=$PATH:/usr/local/Cellar/postgresql@9.6/9.6.9/bin/

alias startpsql='pg_ctl -D /bin/pgData/ start'

#########################
### Path Variables    ###
#########################
export WS="/workspace"
export SCALA_HOME="/bin/scala_current"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_05)
export JAVA_OPTIONS="-Xms64m -Xmx4G -Xss2m -XX:MaxPermSize=2G"
export SBT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"
# export GEM_HOME=/usr/local/bin/ruby/2.0.0/gems/
export RABBIT_HOME=/usr/local/Cellar/rabbitmq/3.6.6/sbin
export NVM_HOME="$HOME/.nvm"

export PATH=$PATH:$SCALA_HOME
export PATH=$PATH:$SCALA_HOME/bin
export PATH=/bin:$PATH
export PATH=$PATH:/bin/s3cmd-1.5.0-rc1
export PATH=~/bin/spark-1.2.1-bin-hadoop2.4/bin/:$PATH
export PATH=~/3rdParty/phantomjs/bin/:$PATH
export PATH=$GEM_HOME:$PATH
export PATH=$RABBIT_HOME:$PATH
export PATH=$PATH:/.stack/programs/x86_64-osx/ghc-8.0.1/bin/ghc
export PATH=$PATH:/usr/local/share/dotnet
export PATH=~/.local/bin:$PATH

## Ensure programs installed by brew are given preference, unless otherwise specified
export PATH=/usr/local/bin:$PATH

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

########################
### Git              ###
########################

export PATH=$PATH:/bin/bootScripts/git/
# source ~/bin/bootScripts/git/gitFuncs.sh
export REVIEW_BASE=master # Used in some git aliases

export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
