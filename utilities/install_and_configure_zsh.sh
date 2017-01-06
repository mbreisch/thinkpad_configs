#!/bin/bash

echo "Checking if zsh is installed"

if dpkg-query -Wf'${db:Status-abbrev}' "zsh" 2>/dev/null | grep -q '^i'; then
    echo 'Why yes, the package "zsh" is installed!\n'
else
    echo 'The package "zsh" is not installed! Installing now...\n'
    sudo apt-get update && sudo apt-get install zsh
fi

echo 'Installing oh-my-zsh'

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo 'Symlinking .zshrc`
ln -sfr ../dotfiles/zsh/zshrc ~/.zshrc

echo 'Installing Powerlines Fonts'
git clone https://github.com/powerline/fonts /tmp/powerline
sudo chmod +x /tmp/powerline/install.sh
sh /tmp/powerline/install.sh

echo `Installation complete, please change fonts in terminal emulator'



