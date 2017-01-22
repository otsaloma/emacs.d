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
   company-tern
   csv-mode
   dos
   git-gutter-fringe+
   graphql-mode
   helm
   helm-dash
   helm-projectile
   js-comint
   js2-mode
   linear-undo
   magit
   markdown-mode
   neotree
   pcre2el
   php-mode
   rainbow-mode
   smooth-scrolling
   tabbar
   tern
   wcheck-mode
   yasnippet
   ))
(message "%s" "All done!")
