;;; -*- coding: utf-8-unix -*-

;; Speed up init by doing garbage collection less often.
;; https://www.reddit.com/r/emacs/comments/3kqt6e/
(setq gc-cons-threshold (* 100 1024 1024))
(run-with-idle-timer 3 nil #'(lambda () (setq gc-cons-threshold (* 2 1024 1024))))

;; Avoid questions about where to save abbrevs.
(setq save-abbrevs nil)

;; Silence "package cl is deprecated" warnings.
(setq byte-compile-warnings '(not obsolete))

;; Use straight.el to lock package versions.
;; https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'all-the-icons)
(straight-use-package 'anaconda-mode)
(straight-use-package 'company)
(straight-use-package 'company-auctex)
(straight-use-package 'company-dict)
(straight-use-package 'company-jedi)
(straight-use-package 'direnv)
(straight-use-package 'dockerfile-mode)
(straight-use-package 'doom-themes)
(straight-use-package 'dtrt-indent)
(straight-use-package 'editorconfig)
(straight-use-package 'eglot)
(straight-use-package 'ess)
(straight-use-package 'flycheck)
(straight-use-package 'git-gutter-fringe+)
(straight-use-package 'graphql-mode)
(straight-use-package 'helm)
(straight-use-package 'helm-dash)
(straight-use-package 'helm-projectile)
(straight-use-package 'js-comint)
(straight-use-package 'json-mode)
(straight-use-package 'lua-mode)
(straight-use-package 'ligature)
(straight-use-package 'markdown-mode)
(straight-use-package 'neotree)
(straight-use-package 'pcre2el)
(straight-use-package 'rainbow-mode)
(straight-use-package 'rust-mode)
(straight-use-package 's)
(straight-use-package 'sqlup-mode)
(straight-use-package 'sudo-edit)
(straight-use-package 'tabbar)
(straight-use-package 'tide)
(straight-use-package 'vterm)
(straight-use-package 'wcheck-mode)
(straight-use-package 'yaml-mode)
(straight-use-package 'yasnippet)

(push "~/.emacs.d/init-lisp" load-path)

;; Do less filename checks when loading requires.
;; https://www.reddit.com/r/emacs/comments/3kqt6e/
(let ((file-name-handler-alist nil))
  ;; Load in the correct order.
  (require 'ots-theme)
  (require 'ots-util)
  ;; Load in the correct order.
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
  (require 'ots-flycheck-mode)
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
  (require 'ots-json-mode)
  (require 'ots-keys)
  (require 'ots-latex-mode)
  (require 'ots-ligature)
  (require 'ots-line-numbers)
  (require 'ots-lua-mode)
  (require 'ots-makefile-mode)
  (require 'ots-markdown-mode)
  (require 'ots-minibuffer)
  (require 'ots-mode-line)
  (require 'ots-neotree)
  (require 'ots-pcre)
  (require 'ots-po-mode)
  (require 'ots-prog-mode)
  (require 'ots-projectile)
  (require 'ots-python-mode)
  (require 'ots-rainbow-mode)
  (require 'ots-rust-mode)
  (require 'ots-sh-mode)
  (require 'ots-shell-mode)
  (require 'ots-sql-mode)
  (require 'ots-tabbar)
  (require 'ots-text-mode)
  (require 'ots-trailing-space)
  (require 'ots-uniquify)
  (require 'ots-vterm)
  (require 'ots-wcheck-mode)
  (require 'ots-whitespace-mode)
  (require 'ots-woman-mode)
  (require 'ots-xml-mode)
  (require 'ots-yaml-mode)
  (require 'ots-yank-indent)
  (require 'ots-yasnippet))
