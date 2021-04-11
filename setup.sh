#!/usr/bin/env bash

set -e

DOTFILES_REPO="https://github.com/habu-kagumba/dotfiles"
DOTFILES_DEST="${HOME}/.config/nixpkgs"

# Pretty utils
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
POWDER_BLUE=$(tput setaf 153)
NORMAL=$(tput sgr0)

print_out() {
  printf "\n\n${POWDER_BLUE}----------------------------------------${NORMAL}"
  printf "\n\t ${POWDER_BLUE}$1${NORMAL}\n"
  printf "${POWDER_BLUE}----------------------------------------${NORMAL}\n\n"
}

nix_setup() {
	### Install Nix
	print_out "Nix installing"
	sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume

	echo ". /Users/herbertkagumba/.nix-profile/etc/profile.d/nix.sh" >> ~/.profile

	nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
	nix-channel --update

	### Install home-manager
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
	export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
	nix-shell '<home-manager>' -A install
}

homebrew_setup() {
  if ! command -v brew > /dev/null; then
    print_out "Homebrew installing"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval $(/opt/homebrew/bin/brew shellenv)
  fi

  print_out "Homebrew updating"
  brew update
}

dotfiles_setup() {
  print_out "Setup dotfiles"

  # clone dotfiles
  printf "\n${CYAN}Cloning dotfiles${NORMAL}"
  rm -rf "${DOTFILES_DEST}"
  git clone "${DOTFILES_REPO}" "${DOTFILES_DEST}"
  printf " ${GREEN}✔︎${NORMAL}\n"
}

setup() {
  printf "\n${CYAN}Home-manager config${NORMAL}"
  home-manager switch
  printf " ${GREEN}✔︎${NORMAL}\n"

  printf "\n${CYAN}Neovim language deps${NORMAL}"
  gem install pry bundler neovim rubocop solargraph
  pip3 install neovim flake8
  printf " ${GREEN}✔︎${NORMAL}\n"

  printf "\n${CYAN}Install homebrew apps${NORMAL}"
  brew bundle --file "${DOTFILES_DEST}/config/macos";
  printf " ${GREEN}✔︎${NORMAL}\n"
}

cd $HOME

print_out "Setup powered by Nix"

homebrew_setup
dotfiles_setup
nix_setup
setup
