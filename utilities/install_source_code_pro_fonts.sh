#!/bin/bash

git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.local/share/fonts/adobe-fonts/source-code-pro

fc-cache -f -v 

