#!/bin/bash
echo "Install enhancd"
#--Fzy--
echo "Install fzy"
brew install fzy
#--Oh-my-posh--
echo "Install oh-my-posh"
brew update && brew upgrade oh-my-posh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
#--Lazygit--
echo "Install lazygit"
brew install jesseduffield/lazygit/lazygit