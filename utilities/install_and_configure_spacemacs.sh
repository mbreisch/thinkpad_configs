#!/bin/bash

sudo apt-get install emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -sfr ../dotfiles/spacemacs/spacemacs ~/.spacemacs

echo Please install the source code pro fonts
