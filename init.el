;;; -*- coding: utf-8-unix -*-

;; Speed up init by doing garbage collection less often.
;; https://www.reddit.com/r/emacs/comments/3kqt6e/
(setq gc-cons-threshold (* 100 1024 1024))
(run-with-idle-timer 5 nil #'(lambda ()
  (setq gc-cons-threshold (* 10 1024 1024))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(push "~/.emacs.d/init-lisp" load-path)
(byte-recompile-directory "~/.emacs.d/init-lisp" 0)

;; Do less filename checks when loading requires.
;; https://www.reddit.com/r/emacs/comments/3kqt6e/
(let ((file-name-handler-alist nil))
  (require 'ots-ansi-color)
  (require 'ots-auto-complete)
  (require 'ots-backup)
  (require 'ots-bibtex-mode)
  (require 'ots-browse-url)
  (require 'ots-c-mode)
  (require 'ots-change-log-mode)
  (require 'ots-comint-mode)
  (require 'ots-compilation-mode)
  (require 'ots-conf-mode)
  (require 'ots-css-mode)
  (require 'ots-diff-mode)
  (require 'ots-dos-mode)
  (require 'ots-editor)
  (require 'ots-emacs-lisp-mode)
  (require 'ots-environment)
  (require 'ots-ess-mode)
  (require 'ots-fringe)
  (require 'ots-fullscreen)
  (require 'ots-git-gutter)
  (require 'ots-helm)
  (require 'ots-helm-dash)
  (require 'ots-hideshow)
  (require 'ots-html-mode)
  (require 'ots-imenu)
  (require 'ots-inferior-ess-mode)
  (require 'ots-java-mode)
  (require 'ots-js-mode)
  (require 'ots-json-mode)
  (require 'ots-keys)
  (require 'ots-latex-mode)
  (require 'ots-linear-undo)
  (require 'ots-linum)
  (require 'ots-makefile-mode)
  (require 'ots-markdown-mode)
  (require 'ots-minibuffer)
  (require 'ots-mode-line)
  (require 'ots-moinmoin-mode)
  (require 'ots-perl-mode)
  (require 'ots-php-mode)
  (require 'ots-po-mode)
  (require 'ots-python-mode)
  (require 'ots-qml-mode)
  (require 'ots-rainbow-mode)
  (require 'ots-server)
  (require 'ots-sgml-xml-mode)
  (require 'ots-sh-mode)
  (require 'ots-shell-mode)
  (require 'ots-smooth-scrolling)
  (require 'ots-tabbar)
  (require 'ots-text-mode)
  (require 'ots-theme)
  (require 'ots-trailing-space)
  (require 'ots-uniquify)
  (require 'ots-wcheck-mode)
  (require 'ots-whitespace-mode)
  (require 'ots-woman-mode)
  (require 'ots-yaml-mode)
  (require 'ots-yank-indent)
  (require 'ots-yasnippet))

(run-with-timer 0.001 nil #'(lambda () (message "")))
