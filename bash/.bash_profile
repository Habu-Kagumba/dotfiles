export LC_ALL=en_US.UTF-8
alias ag='ag --path-to-ignore ~/.agignore'
alias vim='nvim'

alias jstags='find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
alias jstagsa='find . -type f -iregex ".*\.js$" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'

alias jscode='cd $HOME/Dev/JS-code'
alias rbcode='cd $HOME/Dev/Ruby-code'
alias pycode='cd $HOME/Dev/Python-code'
alias gocodeold='cd $GOPATH'
alias gocode='cd $GOPATH/code'
alias opscode='cd $HOME/Dev/DevOps-code'
alias javacode='cd $HOME/Dev/Java-code'
alias elmcode='cd $HOME/Dev/Elm-code'
alias sqlcode='cd $HOME/Dev/SQL-code'
alias mobilecode='cd $HOME/Dev/Mobile'
alias androidcode='cd $HOME/Dev/Mobile/Android-code'
alias ioscode='cd $HOME/Dev/Mobile/iOS-code'
alias qacode='cd $HOME/Dev/QA-code'
alias docscode='cd $HOME/Dev/Docs-code'
alias phpcode='cd $HOME/Dev/PHP-code'

alias gtr='git tag -l | xargs git tag -d && git fetch --tags'

alias dc='docker-compose'
alias dm='docker-machine'
alias ds='docker stop $(docker ps -a -q)'
alias drmi='docker rmi -f $(docker images -a -q)'
alias drmc='ds && docker rm -f $(docker ps -a -q)'
alias drmv='docker volume rm -f $(docker volume ls -q)'
alias dclean='drmc & drmi & drmv'

alias vag='vagrant'
alias vagup='vagrant up'
alias vagdestroy='vagrant destroy'
alias vagssh='vagrant ssh'
alias vaghalt='vagrant halt'

alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'

alias htop='sudo htop'

alias chime_off='sudo nvram SystemAudioVolume=%80'
alias chime_on='sudo nvram -d SystemAudioVolume'

alias bstub='bundle install --binstubs .bundle/bin && rbenv rehash'
alias b='bundle'
alias bx='bundle exec'
alias bip='bundle install --path .bundle --clean'
alias bu='bundle update'

## Add tmux alias here
alias tm='tmux new-session -s "$(basename "$PWD")"'
alias tma='tmux attach-session -t "$(basename "$PWD")"'
alias tmd='tmux detach'
alias tml='tmux ls'
alias tmk='tmux kill-session'
alias mx='tmuxinator'

alias lg='lazygit'
export GPG_TTY=$(tty)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/herbertkagumba/.sdkman"
[[ -s "/Users/herbertkagumba/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/herbertkagumba/.sdkman/bin/sdkman-init.sh"
