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
 '(auto-complete
   dos
   git-gutter-fringe+
   helm
   helm-dash
   helm-ls-git
   jedi
   js-comint
   js2-mode
   linear-undo
   magit
   markdown-mode
   php-mode
   rainbow-mode
   smooth-scrolling
   tabbar
   wcheck-mode
   yasnippet
   ))
(message "%s" "All done!")
