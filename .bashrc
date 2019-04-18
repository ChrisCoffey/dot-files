############
#
#  Config Variables
#
###########
ulimit -n 4096
export PS1="ccoffey-work λ"

alias ..="cd .."
alias ...=".. && .."
alias ....=".. && ..."
alias ll="ls -al"
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

##########################
### Haskell Aliases   ####
##########################
alias hb="stack build"
alias hbd="stack build --haddock --no-haddock-deps --haddock-internal"
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
### Purescript Aliases   ####
##########################
alias pb="yarn run pulp build"
alias pr="yarn run start"

#########################
### Postgres          ###
#########################
export PATH=$PATH:/usr/local/Cellar/postgresql@9.6/9.6.9/bin

alias startpsql='pg_ctl -D /Users/chriscoffey/bin/pgData/ start'

#########################
### Path Variables    ###
#########################
export WS="/Users/chriscoffey/workspace"
export SCALA_HOME="/Users/chriscoffey/bin/scala_current"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_05)
export JAVA_OPTIONS="-Xms64m -Xmx4G -Xss2m -XX:MaxPermSize=2G"
export SBT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"
export GEM_HOME=/usr/local/bin/ruby/2.0.0/gems
export RABBIT_HOME=/usr/local/Cellar/rabbitmq/3.6.6/sbin
export NVM_HOME="$HOME/.nvm"

export PATH=$PATH:$SCALA_HOME
export PATH=$PATH:$SCALA_HOME/bin
export PATH=/Users/chriscoffey/bin:$PATH
export PATH=/Users/chriscoffey/.local/bin:$PATH
export PATH=$PATH:/Users/chriscoffey/bin/bootScripts/git
export PATH=$PATH:/Users/chriscoffey/bin/s3cmd-1.5.0-rc1
export PATH=~/bin/spark-1.2.1-bin-hadoop2.4/bin:$PATH
export PATH=~/3rdParty/phantomjs/bin/:$PATH
export PATH=$GEM_HOME:$PATH
export PATH=$RABBIT_HOME:$PATH
export PATH=$PATH:/Users/chriscoffey/.stack/programs/x86_64-osx/ghc-8.0.1/bin/ghc
export PATH=$PATH:/usr/local/share/dotnet

## Ensure programs installed by brew are given preference, unless otherwise specified
export PATH=/usr/local/bin:$PATH

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

########################

source ~/bin/bootScripts/git/gitFuncs.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
