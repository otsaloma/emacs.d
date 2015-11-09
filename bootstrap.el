;;; -*- coding: utf-8-unix -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
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
   jedi
   linear-undo
   lua-mode
   markdown-mode
   php-mode
   rainbow-mode
   smooth-scrolling
   tabbar
   wcheck-mode
   yasnippet
   ))
(message "%s" "All done!")
(message "%s" "Hit Ctrl-C to quit.")
