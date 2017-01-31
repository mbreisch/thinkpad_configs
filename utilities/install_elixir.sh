#!/bin/bash

wget -P /tmp https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i /tmp/erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang
sudo apt-get install elixir

echo "Installing bunt and credo for flychecking"
echo "Install bunt ..."
git clone https://github.com/rrrene/bunt /tmp/bunt
cd /tmp/bunt
mix archive.build
mix archive.install
echo "Installing credo..."
git clone https://github.com/rrrene/credo /tmp/credo
cd /tmp/credo
mix deps.get
mix archive.build
mix archive.install



