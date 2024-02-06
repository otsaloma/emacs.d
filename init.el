;;; -*- coding: utf-8-unix -*-

;; Speed up by doing garbage collect less often.
;; https://akrl.sdf.org/#orgc15a10d
(defmacro k-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

;; Set garbage collection threshold to 1 GB.
(setq gc-cons-threshold #x40000000)

;; When idle for 15 s run the GC no matter what.
(defvar k-gc-timer
  (run-with-idle-timer 15 t
                       (lambda ()
                         (message "Garbage Collect ran in %.03f s"
                                  (k-time (garbage-collect))))))

;; Avoid questions about where to save abbrevs.
(setq save-abbrevs nil)

;; Silence uninteresting warnings.
(setq byte-compile-warnings '(not obsolete))
(setq warning-minimum-level :error)

;; Use straight.el to lock package versions.
;; https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-vc-git-default-clone-depth 1)

;; TODO: Drop :host and :repo once MELPA is up-to-date.
(straight-use-package '(shell-maker :host github :repo "xenodium/chatgpt-shell"))
(straight-use-package '(chatgpt-shell :host github :repo "xenodium/chatgpt-shell"))
(straight-use-package '(copilot :host github :repo "copilot-emacs/copilot.el"))

(straight-use-package 'all-the-icons)
(straight-use-package 'company)
(straight-use-package 'company-auctex)
(straight-use-package 'company-dict)
(straight-use-package 'direnv)
(straight-use-package 'dockerfile-mode)
(straight-use-package 'doom-themes)
(straight-use-package 'dtrt-indent)
(straight-use-package 'editorconfig)
(straight-use-package 'ess)
(straight-use-package 'flycheck)
(straight-use-package 'git-gutter)
(straight-use-package 'git-gutter-fringe)
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
(straight-use-package 'olivetti)
(straight-use-package 'pcre2el)
(straight-use-package 'rainbow-mode)
(straight-use-package 'rust-mode)
(straight-use-package 's)
(straight-use-package 'sqlup-mode)
(straight-use-package 'sudo-edit)
(straight-use-package 'tabbar)
(straight-use-package 'tide)
(straight-use-package 'treesit-auto)
(straight-use-package 'vterm)
(straight-use-package 'wcheck-mode)
(straight-use-package 'yaml-mode)
(straight-use-package 'yasnippet)

(push "~/.emacs.d/init-lisp" load-path)

(require 'use-package)

;; Do less filename checks when loading requires.
;; https://www.reddit.com/r/emacs/comments/3kqt6e/
(let ((file-name-handler-alist nil))
  ;; Load in the correct order.
  (require 'ots-theme)
  (require 'ots-util)
  ;; Load in the correct order.
  (require 'ots-backup)
  (require 'ots-bat)
  (require 'ots-bibtex)
  (require 'ots-browse-url)
  (require 'ots-c)
  (require 'ots-c++)
  (require 'ots-chatgpt-shell)
  (require 'ots-comint)
  (require 'ots-company)
  (require 'ots-compilation)
  (require 'ots-conf)
  (require 'ots-copilot)
  (require 'ots-css)
  (require 'ots-diff)
  (require 'ots-dockerfile)
  (require 'ots-editor)
  (require 'ots-editorconfig)
  (require 'ots-emacs-lisp)
  (require 'ots-environment)
  (require 'ots-ess)
  (require 'ots-flycheck)
  (require 'ots-git-gutter)
  (require 'ots-gpg)
  (require 'ots-graphql)
  (require 'ots-helm)
  (require 'ots-helm-dash)
  (require 'ots-html)
  (require 'ots-imenu)
  (require 'ots-inferior-ess)
  (require 'ots-java)
  (require 'ots-js)
  (require 'ots-json)
  (require 'ots-latex)
  (require 'ots-ligature)
  (require 'ots-line-numbers)
  (require 'ots-lua)
  (require 'ots-makefile)
  (require 'ots-markdown)
  (require 'ots-minibuffer)
  (require 'ots-mode-line)
  (require 'ots-neotree)
  (require 'ots-pcre)
  (require 'ots-po)
  (require 'ots-prog)
  (require 'ots-projectile)
  (require 'ots-python)
  (require 'ots-rainbow)
  (require 'ots-rust)
  (require 'ots-sh)
  (require 'ots-sql)
  (require 'ots-tabbar)
  (require 'ots-text)
  (require 'ots-trailing-space)
  (require 'ots-tree-sitter)
  (require 'ots-uniquify)
  (require 'ots-vterm)
  (require 'ots-wcheck)
  (require 'ots-whitespace)
  (require 'ots-woman)
  (require 'ots-xml)
  (require 'ots-yaml)
  (require 'ots-yank-indent)
  (require 'ots-yasnippet)
  ;; Load in the correct order.
  (require 'ots-keys))
