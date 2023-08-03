# -*- coding: utf-8-unix -*-

EMACS = /usr/bin/emacs

bootstrap:
	rm -rf straight/build
	rm -rf straight/repos
	rm -rf straight/build-cache.el
	$(EMACS) --script init.el

upgrade:
	rm -rf straight/versions/default.el
	$(MAKE) bootstrap
	$(EMACS) -f straight-freeze-versions --kill

.PHONY: bootstrap upgrade
