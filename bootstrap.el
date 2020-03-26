;;; -*- coding: utf-8-unix -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)
(package-initialize)
(mapcar
 (lambda (package)
   (unless (package-installed-p package)
     (package-install package)))
 '(all-the-icons
   company
   company-auctex
   company-dict
   company-jedi
   company-lsp
   direnv
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
   lua-mode
   markdown-mode
   neotree
   pcre2el
   rainbow-mode
   rjsx-mode
   rust-mode
   s
   sqlup-mode
   sudo-edit
   tabbar
   tide
   undo-tree
   wcheck-mode
   yaml-mode
   yasnippet
   ))
