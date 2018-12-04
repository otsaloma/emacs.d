;;; -*- coding: utf-8-unix -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(package-refresh-contents)
(package-initialize)
(mapcar
 (lambda (package)
   (unless (package-installed-p package)
     (package-install package)))
 '(all-the-icons
   anaconda-mode
   company
   company-anaconda
   company-auctex
   company-dict
   company-jedi
   company-lsp
   company-tern
   dockerfile-mode
   doom-themes
   dtrt-indent
   editorconfig
   ess
   flycheck
   git-gutter-fringe+
   graphql-mode
   helm
   helm-dash
   helm-projectile
   js-comint
   json-mode
   lsp-mode
   lsp-python
   markdown-mode
   mmm-mode
   neotree
   pcre2el
   racer
   rainbow-mode
   rjsx-mode
   rust-mode
   sqlup-mode
   sudo-edit
   tabbar
   tern
   undo-tree
   wcheck-mode
   yaml-mode
   yasnippet
   ))
