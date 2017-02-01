#! /bin/bash

ASDF_VERSION=v0.2.1
if [ "$1" = "install" ]; then
    echo "Installing requirements"
    sudo apt-get install -y git curl build-essential autoconf m4 libwxgtk3.0-dev libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev automake libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch ${ASDF_VERSION}
    echo "Asdf successfully installed ensure the following lines are in your zshrc file"
    echo ". $HOME/.asdf/asdf.sh"
    echo ". $HOME/.asdf/completions/asdf.bash"
elif [ "$1" = "nodejs" ]; then
    echo "Installing nodejs plugin"
    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs
elif [ "$1" = "erlang" ]; then
    echo "Installing erlang plugin"
    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
elif [ "$1" = "elixir" ]; then
    echo "Installing elixir plugin"
    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir
else
    echo "Choices: install|nodejs|erlang|elixir"
fi

