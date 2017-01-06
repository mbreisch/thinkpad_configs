#!/bin/bash

# Tested on Xubuntu 16.10
PPA_LIST_FILENAME="os_ppas.apt"
PACKAGE_LIST_FILENAME="os_packages.apt"

function list_packages()
{
    grep -v "#" "${PACKAGE_LIST_FILENAME}" | grep -v "^$";
}

function install_packages()
{
    sudo apt-get update;
    list_packages | xargs sudo apt-get install -y;
}

function install_ppas()
{
   while read -r ppa; do
    [[ "$ppa" =~ ^#.*$ ]] && continue
    sudo apt-add-repository "${ppa}"
   done < "${PPA_LIST_FILENAME}"
}

if [ "$1" = "ppas" ]; then
    install_ppas
elif [ "$1" = "packages" ]; then
    install_packages
elif [ "$1" = "full" ]; then
    install_ppas
    install_packages
else
    echo "Choices for installation: ppas|packages|full"
fi

