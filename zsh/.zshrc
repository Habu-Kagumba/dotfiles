source $HOME/.bash_profile

# =================
#   PATH
# =================

export PATH="$HOME/bin:$PATH"
export GOPATH="$HOME/Dev/Go-code/"
export PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/10/bin:$PATH"
export PATH="$HOME/Packages/flutter/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"

# =================
#   EXPORTS
# =================
export EDITOR=/usr/local/bin/nvim

export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export FZF_DEFAULT_OPTS='
	--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
	--color info:183,prompt:110,spinner:107,pointer:167,marker:215
'

ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""

plugins=(git zsh-syntax-highlighting)
fpath=(/usr/local/share/zsh-completions $fpath)

# Fixing https://github.com/robbyrussell/oh-my-zsh/issues/6835
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

autoload -U promptinit; promptinit

prompt pure
PROMPT='%(?.%F{magenta}.%F{red}❯%F{magenta})❯%f '


# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
	source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
	source $HOME/.profile  # Read Mac .profile, if present.
fi

# =====================
#   Shell Functions
# =====================
function qfind () {
	find . -exec grep -l -s $1 {} \;
	return 0
}

function git() { hub $@; }

function pips() {
	package_name=$1
	requirements_file=$2
	if [[ -z $requirements_file ]]
	then
		requirements_file='./requirements.txt'
	fi
	pip install $package_name && pip freeze | grep -i $package_name >> $requirements_file
}

function gi() { curl -L -s https://www.gitignore.io/api/$@ ; }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
