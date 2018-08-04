;;; -*- coding: utf-8-unix -*-

;; Speed up init by doing garbage collection less often.
;; http://www.reddit.com/r/emacs/comments/3kqt6e/
;; http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(setq gc-cons-threshold most-positive-fixnum)
(run-with-idle-timer 5 nil #'(lambda ()
  (setq gc-cons-threshold (* 100 1024 1024))))

;; Don't save package-selected-packages.
(setq custom-file "/dev/null")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(package-initialize)

;; Avoid questions about where to save abbrevs.
;; XXX: Why must this be before loading init-lisp?
(setq save-abbrevs nil)

;; Allow conditional rules to apply work environment style guides
;; etc. as exceptions only on work computer/environment.
(setq ots-environment-work (string= (system-name) "thinkpad"))

(push "~/.emacs.d/init-lisp" load-path)
(byte-recompile-directory "~/.emacs.d/init-lisp" 0)

;; Do less filename checks when loading requires.
;; https://www.reddit.com/r/emacs/comments/3kqt6e/
(let ((file-name-handler-alist nil))
  ;; Load in the correct order.
  (require 'ots-normal)
  (require 'ots-theme)
  (require 'ots-util)
  ;; Load in the correct order.
  (require 'ots-ansi-color)
  (require 'ots-backup)
  (require 'ots-bat-mode)
  (require 'ots-bibtex-mode)
  (require 'ots-browse-url)
  (require 'ots-c-mode)
  (require 'ots-c++-mode)
  (require 'ots-comint-mode)
  (require 'ots-company)
  (require 'ots-compilation-mode)
  (require 'ots-conf-mode)
  (require 'ots-css-mode)
  (require 'ots-diff-mode)
  (require 'ots-dired)
  (require 'ots-dockerfile-mode)
  (require 'ots-editor)
  (require 'ots-editorconfig)
  (require 'ots-emacs-lisp-mode)
  (require 'ots-environment)
  (require 'ots-ess-mode)
  (require 'ots-fringe)
  (require 'ots-git-gutter)
  (require 'ots-gpg)
  (require 'ots-graphql-mode)
  (require 'ots-helm)
  (require 'ots-helm-dash)
  (require 'ots-hideshow)
  (require 'ots-html-mode)
  (require 'ots-imenu)
  (require 'ots-inferior-ess-mode)
  (require 'ots-java-mode)
  (require 'ots-js-mode)
  (require 'ots-jsx-mode)
  (require 'ots-json-mode)
  (require 'ots-keys)
  (require 'ots-latex-mode)
  (require 'ots-linum)
  (require 'ots-makefile-mode)
  (require 'ots-markdown-mode)
  (require 'ots-minibuffer)
  (require 'ots-mmm-mode)
  (require 'ots-mode-line)
  (require 'ots-neotree)
  (require 'ots-octave-mode)
  (require 'ots-pcre)
  (require 'ots-po-mode)
  (require 'ots-prog-mode)
  (require 'ots-projectile)
  (require 'ots-python-mode)
  (require 'ots-qml-mode)
  (require 'ots-rainbow-mode)
  (require 'ots-rust-mode)
  (require 'ots-server)
  (require 'ots-sh-mode)
  (require 'ots-shell-mode)
  (require 'ots-sql-mode)
  (require 'ots-tabbar)
  (require 'ots-text-mode)
  (require 'ots-trailing-space)
  (require 'ots-undo-tree)
  (require 'ots-uniquify)
  (require 'ots-wcheck-mode)
  (require 'ots-whitespace-mode)
  (require 'ots-woman-mode)
  (require 'ots-xml-mode)
  (require 'ots-yaml-mode)
  (require 'ots-yank-indent)
  (require 'ots-yasnippet))

(run-with-timer 0.001 nil #'(lambda () (message "")))
