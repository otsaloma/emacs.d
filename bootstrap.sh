#!/bin/sh
rm -rf straight/build
rm -rf straight/repos
rm -rf straight/build-cache.el
/usr/bin/emacs --script init.el
