# -*- coding: utf-8-unix -*-

EMACS = /usr/bin/emacs

bootstrap:
	rm -rf straight/build
	rm -rf straight/modified
	rm -rf straight/repos
	rm -rf straight/build-cache.el
	$(EMACS) --script init.el

upgrade:
	rm -rf straight/versions/default.el
	$(MAKE) bootstrap
	$(EMACS) -f straight-freeze-versions --kill

# Not needed for a major upgrade, just for adding a single package
# (to see if a recipe has been added for some brand new package).
update-recipes:
	$(EMACS) -f straight-pull-recipe-repositories --kill

.PHONY: bootstrap upgrade update-recipes
