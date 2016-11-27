;;; -*- coding: utf-8-unix -*-

;; Speed up init by doing garbage collection less often.
;; http://www.reddit.com/r/emacs/comments/3kqt6e/
;; http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(setq gc-cons-threshold most-positive-fixnum)
(run-with-idle-timer 5 nil #'(lambda ()
  (setq gc-cons-threshold (* 100 1024 1024))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(package-initialize)

;; Avoid questions about where to save abbrevs.
;; XXX: Why must this be before loading init-lisp?
(setq save-abbrevs nil)

(push "~/.emacs.d/init-lisp" load-path)
(byte-recompile-directory "~/.emacs.d/init-lisp" 0)

;; Do less filename checks when loading requires.
;; https://www.reddit.com/r/emacs/comments/3kqt6e/
(let ((file-name-handler-alist nil))
  (require 'ots-ansi-color)
  (require 'ots-backup)
  (require 'ots-bibtex-mode)
  (require 'ots-browse-url)
  (require 'ots-c-mode)
  (require 'ots-c++-mode)
  (require 'ots-change-log-mode)
  (require 'ots-csv-mode)
  (require 'ots-comint-mode)
  (require 'ots-company)
  (require 'ots-compilation-mode)
  (require 'ots-conf-mode)
  (require 'ots-css-mode)
  (require 'ots-diff-mode)
  (require 'ots-dired)
  (require 'ots-dos-mode)
  (require 'ots-editor)
  (require 'ots-emacs-lisp-mode)
  (require 'ots-environment)
  (require 'ots-ess-mode)
  (require 'ots-fringe)
  (require 'ots-fullscreen)
  (require 'ots-git-gutter)
  (require 'ots-graphql-mode)
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
  (require 'ots-magit)
  (require 'ots-makefile-mode)
  (require 'ots-markdown-mode)
  (require 'ots-minibuffer)
  (require 'ots-mode-line)
  (require 'ots-neotree)
  (require 'ots-pcre)
  (require 'ots-perl-mode)
  (require 'ots-php-mode)
  (require 'ots-po-mode)
  (require 'ots-projectile)
  (require 'ots-python-mode)
  (require 'ots-qml-mode)
  (require 'ots-rainbow-mode)
  (require 'ots-server)
  (require 'ots-sh-mode)
  (require 'ots-shell-mode)
  (require 'ots-smooth-scrolling)
  (require 'ots-sql-mode)
  (require 'ots-tabbar)
  (require 'ots-text-mode)
  (require 'ots-theme)
  (require 'ots-trailing-space)
  (require 'ots-uniquify)
  (require 'ots-wcheck-mode)
  (require 'ots-whitespace-mode)
  (require 'ots-woman-mode)
  (require 'ots-xml-mode)
  (require 'ots-yaml-mode)
  (require 'ots-yank-indent)
  (require 'ots-yasnippet))

(run-with-timer 0.001 nil #'(lambda () (message "")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (graphql-mode wcheck-mode tabbar smooth-scrolling rainbow-mode php-mode pcre2el neotree markdown-mode magit linear-undo js2-mode js-comint helm-projectile helm-dash git-gutter-fringe+ dos csv-mode company-tern company-dict company-auctex company-anaconda))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
