;;; -*- coding: utf-8 -*-
;;; ots-js-mode.el

(defun ots-js-mode-get-tern-exe ()
  "Return path to the tern executable on Windows."
  (concat (replace-regexp-in-string "\\\\" "/" (getenv "APPDATA"))
          "/npm/node_modules/tern/bin/tern"))

(defun ots-js-mode-jshint ()
  "Run code quality check with JSHint."
  (interactive)
  (compile (ots-util-expand-command "jshint --reporter=unix %s")))

(defun ots-js-mode-run-js ()
  "Start an interactive JavaScript interpreter."
  (interactive)
  (require 'js-comint)
  (setenv "NODE_NO_READLINE" "1")
  (run-js inferior-js-program-command)
  (delete-other-windows))

(defun ots-js-mode-set-faces ()
  "Set faces for editing JavaScript files."
  (font-lock-add-keywords
   nil '(("\\<\\(self\\|that\\|this\\)\\>" 1 font-lock-variable-name-face)
         ("^ *\\<\\([a-zA-Z0-9_]+\\) = " 1 font-lock-variable-name-face))))

(defun ots-js-mode-set-imenu ()
  "Set imenu index patterns for JavaScript files."
  (setq imenu-generic-expression
        '((nil "^var +\\([^ =]+\\)[ =]" 1)
          (nil "^function +\\([^(]+\\)(" 1)))
  (setq imenu-create-index-function
        'imenu-default-create-index-function))

(defun ots-js-mode-set-linting ()
  "Use js2-mode for linting, but not in derived modes."
  (setq js2-highlight-external-variables nil)
  (setq js2-strict-inconsistent-return-warning nil)
  (setq js2-strict-var-redeclaration-warning nil)
  (if (eq major-mode 'js-mode)
      (js2-minor-mode)))

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

(defun ots-js-mode-tern ()
  "Start tern-mode and its auto-complete."
  (when (eq system-type 'windows-nt)
    ;; XXX: tern-mode can't find tern on Windows.
    ;; https://github.com/ternjs/tern/issues/256
    (setq tern-command (list "node" (ots-js-mode-get-tern-exe))))
  (when (eq major-mode 'js-mode)
    (tern-mode t)
    (setq-local company-backends
     '((company-tern :with company-dabbrev)))))


(add-hook 'js-mode-hook 'ots-js-mode-set-faces)
(add-hook 'js-mode-hook 'ots-js-mode-set-imenu)
(add-hook 'js-mode-hook 'ots-js-mode-set-linting)
(add-hook 'js-mode-hook 'ots-js-mode-set-properties)
(add-hook 'js-mode-hook 'ots-js-mode-tern)
(add-to-list 'interpreter-mode-alist '("node" . js-mode))

(provide 'ots-js-mode)
;;; ots-js-mode.el ends here
