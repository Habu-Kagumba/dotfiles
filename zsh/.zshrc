source $HOME/.bash_profile

autoload -U promptinit; promptinit
prompt pure

# =================
#   PATH
# =================

export PATH="$HOME/bin:$PATH"
export GOPATH="$HOME/Dev/Go-code"
export PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
# export PATH="/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH"

# =================
#   EXPORTS
# =================
export EDITOR=/usr/local/bin/nvim

export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export FZF_DEFAULT_OPTS='
	--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
	--color info:183,prompt:110,spinner:107,pointer:167,marker:215
'

export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="refined"

plugins=(git zsh-syntax-highlighting)
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

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
qfind () {
	find . -exec grep -l -s $1 {} \;
	return 0
}

function git() { hub $@; }

pips() {
	package_name=$1
	requirements_file=$2
	if [[ -z $requirements_file ]]
	then
		requirements_file='./requirements.txt'
	fi
	pip install $package_name && pip freeze | grep -i $package_name >> $requirements_file
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
