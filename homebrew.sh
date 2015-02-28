#!/bin/bash

which -s brew && brew update
which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew upgrade

formulas=(
  bash-completion
  git
  php56
  composer
)

for formula in "${formulas[@]}"; do
  brew install $formula || brew upgrade $formula
done

brew cleanup
