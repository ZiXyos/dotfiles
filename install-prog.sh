:#!/bin/bash

## Xcode command-line tools
xcode-select --install

#Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Using latest Homebrew
brew update
brew upgrade

## Install iterm2
brew cask install iterm2
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## Install nodeJs
brew install node

## Install Editor
brew install neovim

# Install jovial
curl -sSL https://github.com/zthxxx/jovial/raw/master/installer.sh | sudo -E bash -s $USER

## Install lazy app
brew install jesseduffield/lazygit/lazygit
brew install jesseduffield/lazydocker/lazydocker
