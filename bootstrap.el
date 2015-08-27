;;; -*- coding: utf-8-unix -*-

(require 'package)

(setq
 package-archives
 '(("gnu" . "http://elpa.gnu.org/packages/")
   ("melpa" . "http://melpa.org/packages/")
   ("marmalade" . "http://marmalade-repo.org/packages/")))

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
   ))

(message "%s" "All done!")
(message "%s" "Hit Ctrl-C to quit.")
