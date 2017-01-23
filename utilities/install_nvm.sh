#!/bin/bash
NVM_VERSION="v0.33.0"
if [ "$1" = "install" ]; then
    echo 'Installing NVM'
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash
    source ~/.zshrc
    echo 'Installing latest NodeJS'
    nvm install node
    nvm use node
else
    echo "Choice: install"
fi
