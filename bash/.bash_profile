alias ag='ag --path-to-ignore ~/.agignore'
alias vim='nvim'

alias jstags='find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
alias jstagsa='find . -type f -iregex ".*\.js$" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'

alias jscode='cd $HOME/Dev/JS-code'
alias rbcode='cd $HOME/Dev/Ruby-code'
alias pycode='cd $HOME/Dev/Python-code'
alias gocode='cd $HOME/Dev/Go-code/src/github.com/Habu-Kagumba'
alias opscode='cd $HOME/Dev/DevOps-code'
alias androidcode='cd $HOME/Dev/Android-code'
alias javacode='cd $HOME/Dev/Java-code'
alias devopscode='cd $HOME/Dev/DevOps-code'
alias elmcode='cd $HOME/Dev/Elm-code'
alias sqlcode='cd $HOME/Dev/SQL-code'

alias gtr='git tag -l | xargs git tag -d && git fetch --tags'

alias dc='docker-compose'
alias dm='docker-machine'
alias drmi='docker rmi -f $(docker images -a -q)'
alias drmc='docker stop $(docker ps -a -q) && docker rm -f $(docker ps -a -q)'
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

alias bundle_stub='bundle install --binstubs .bundle/bin && rbenv rehash'
alias b='bundle'
alias bx='bundle exec'
alias bip='bundle install --path .bundle'

## Add tmux alias here
alias tm='tmux new-session -s "$(basename "$PWD")"'
alias tma='tmux attach-session -t "$(basename "$PWD")"'
alias tmd='tmux detach'
alias tml='tmux ls'
alias tmk='tmux kill-session'
