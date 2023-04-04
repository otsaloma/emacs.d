#!/bin/sh
rm -rf straight/build
rm -rf straight/repos
rm -rf straight/build-cache.el
/usr/bin/emacs --script init.el
if [ ! -d chatgpt-shell ]; then
    echo "Cloning chatgpt-shell..."
    git clone https://github.com/xenodium/chatgpt-shell.git
fi
