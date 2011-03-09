source $HOME/.bashrc
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
#export CLASSPATH="$CLASSPATH:/usr/local/apache-tomcat-5.5.28/common/lib/servlet-api.jar"
export HISTSIZE=100000
echo "Welcome home, Berni"
uptime

source ~/.gitcompletion

#El meu PS1 anterior
# export PS1="\[\e[33;1m\]\u@\[\e[36;1m\]\h\[\e[0m\]:\W$ "

# Altres PS1
# export PS1="\w$ "
# export PS1='\u:\w$(__git_ps1 " [%s]")\$ '
# export PS1='\w$(__git_ps1 " [%s]")\$ '
# export PS1='[\t] \w$ '
# export CLICOLOR=1
# export LSCOLORS=bxfxcxdxbxegebabagacad

function __git_dirty {
  git diff --quiet HEAD &>/dev/null
  [ $? == 1 ] && echo "!"
}

function __git_branch {
  __git_ps1 "(%s)"
}

function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$version" == "1.8.7" ] && version=""
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full "
}

# via http://tammersaleh.com/posts/a-better-rvm-bash-prompt
bash_prompt() {
  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  local UC=$W                 # user's color
  [ $UID -eq "0" ] && UC=$R   # root's color

  export PS1="\[\e[33;1m\]\u@\[\e[36;1m\]\h\[\e[0m\]:$W\$(__my_rvm_ruby_version)$Y\w $R\$(__git_branch)$C\$(__git_dirty)${NONE}$ "
}

bash_prompt
unset bash_prompt

# MacPorts Installer addition on 2009-11-03_at_17:19:34: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#ls
alias l="ls -lAh"

#cd
alias ..="cd .."

#Editor TextMate
export EDITOR=mvim
alias matew="mate -w"

#Git
alias gs="git status"
alias gss="git status -sb"
alias gl="git pull"
alias gp="git push"
alias gd="git diff"
alias gdc="git diff --cached"
alias gc="git commit -v"
alias gca="git commit -a"
alias glog="git log --decorate --graph"
alias gco="git checkout"

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

alias git=hub

#Other Alias
alias linode="ssh -p $LINODEPORT $LINODEUSER"
alias mrails="mate Capfile README.md config.ru lib Gemfile Rakefile db vendor Gemfile.lock app config public spec"
alias rsass="sass --watch public/stylesheets/sass:public/stylesheets"
alias be="bundle exec"
alias rms="rake db:drop && rake db:create && rake db:setup"
