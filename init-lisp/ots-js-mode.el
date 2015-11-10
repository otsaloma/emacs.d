;;; -*- coding: utf-8 -*-
;;; ots-js-mode.el

(let ((modes '(("\\.\\(geo\\|topo\\)?json$" . js-mode))))
  (setq auto-mode-alist (append modes auto-mode-alist)))

(defun ots-js-mode-jshint ()
  "Run code quality check with JSHint."
  (interactive)
  (compile (ots-util-expand-command "jshint --reporter=unix %s")))

(defun ots-js-mode-run-js ()
  "Start an interactive JavaScript interpreter."
  (interactive)
  (require 'js-comint)
  (setenv "NODE_NO_READLINE" "1")
  (setq inferior-js-program-command "node --interactive")
  (run-js inferior-js-program-command)
  (ansi-color-for-comint-mode-on)
  (set-process-query-on-exit-flag (get-process "js") nil)
  (delete-other-windows))

(defun ots-js-mode-set-faces ()
  "Set faces for editing JavaScript files."
  (font-lock-add-keywords
   nil
   '(("\\<\\(self\\|that\\|this\\)\\>"
      1 font-lock-variable-name-face)
     ;; Variable assignments
     ("^ *\\<\\([a-zA-Z0-9_]+\\) = "
      1 font-lock-variable-name-face)
     )))

(defun ots-js-mode-set-properties ()
  "Set properties for editing JavaScript files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f8>") 'ots-js-mode-run-js)
  (local-set-key (kbd "<f9>") 'ots-js-mode-jshint)
  (hs-minor-mode 1)
  (modify-syntax-entry ?_ "w")
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill)
  (setq-local helm-dash-docsets '("JavaScript" "jQuery")))

(add-hook 'js-mode-hook 'ots-js-mode-set-faces)
(add-hook 'js-mode-hook 'ots-js-mode-set-properties)
(add-to-list 'interpreter-mode-alist '("node" . js-mode))

(provide 'ots-js-mode)
;;; ots-js-mode.el ends here
