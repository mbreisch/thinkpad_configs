#!/bin/bash
echo "Checking if emacs is installed"

if dpkg-query -Wf'${db:Status-abbrev}' "emacs" 2>/dev/null | grep -q '^i'; then
    echo 'Why yes, the package "emacs" is installed!\n'
else
    echo 'The package "emacs" is not installed! Installing now...\n'
    sudo apt-get update && sudo apt-get install emacs 
fi
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -sfr ../dotfiles/spacemacs/spacemacs ~/.spacemacs

echo "Installing sourcecode pro fonts"
git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.local/share/fonts/adobe-fonts/source-code-pro
fc-cache -f -v 
