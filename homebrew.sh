#!/bin/bash

which -s brew && brew update
which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew upgrade

formulas=(
  bash-completion
  git
  php56
  composer
  caskroom/cask/brew-cask
)

for formula in "${formulas[@]}"; do
  brew install $formula || brew upgrade $formula
done

casks=(
  dropbox
  google-chrome
  slack
  sublime-text3
  vagrant
  virtualbox
)

brew tap caskroom/versions

for cask in "${casks[@]}"; do
  brew cask install --appdir="/Applications" $cask
done

brew cleanup
brew cask cleanup
