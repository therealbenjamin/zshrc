# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kafeitu"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/ben/.rvm/gems/ruby-2.0.0-p247/bin:/home/ben/.rvm/gems/ruby-2.0.0-p247@global/bin:/home/ben/.rvm/rubies/ruby-2.0.0-p247/bin:/home/ben/.rvm/bin:/home/ben/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/bin/node-v0.10.21-linux-x64/bin:/usr/local/bin/mongodb-linux-i686-2.4.7/bin

alias  l='ls -a'
alias ll='ls -al'
alias  b='cd ..'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias  s='subl .'
alias a='atom .'
alias  c='clear'
alias sass!='sass --watch public/scss:public/css'
alias haml!='ruby ~/Code/Scripts/watch_haml.rb'
alias prj='ruby ~/Code/Scripts/copy_template.rb'
alias pss='python -m SimpleHTTPServer'
alias rss='~/Code/Scripts/ruby_server.rb'
alias fe='cd ~/Code/NSS-FrontEnd'
alias deploy='ruby ~/Code/Scripts/deploy.rb'
alias startmongo='cd ~ && mongod --config ~/Code/Scripts/mongodb.conf'
alias chrome='open -a "Google Chrome"'
alias chrome-secure='open -a Google\ Chrome --args --disable-web-security'
alias gitjk="history 10 | tail -r | gitjk_cmd"

export PGDATA='/usr/local/var/postgres'
export PGHOST=localhost
alias start-pg='pg_ctl -l $PGDATA/server.log start'
alias stop-pg='pg_ctl -D $PGDATA stop'
alias show-pg-status='pg_ctl status'
alias restart-pg='pg_ctl reload'

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function branch
{
  git status 2> /dev/null | ruby ~/Code/Scripts/branch.rb
}

export PATH=$PATH:/usr/local/bin/node-v0.10.21-linux-x64/bin:/usr/local/bin/mongodb-linux-i686-2.4.7/bin
# PS1="%{$fg[red]%}%~%{$fg[green]%}\$(branch)%{$fg[black]%} >%{$reset_color%}"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
