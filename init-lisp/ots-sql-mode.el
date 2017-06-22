;;; -*- coding: utf-8 -*-
;;; ots-sql-mode.el

(require 'company-dict)

(defun ots-sql-mode-set-faces ()
  "Set faces for editing SQL files."
  (sql-add-product-keywords
   'ansi '(("TINYINT" . font-lock-type-face))))

(defun ots-sql-mode-set-properties ()
  "Set properties for editing SQL files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  ;; Allow double-quotes and backticks (for identifier names).
  (modify-syntax-entry ?\" "\"" sql-mode-syntax-table)
  (modify-syntax-entry ?\` "\"" sql-mode-syntax-table)
  (setq-local company-backends '((company-dict company-dabbrev)))
  (setq-local company-dabbrev-ignore-case t)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("PostgreSQL"))
  (turn-on-auto-fill))

(add-hook 'sql-mode-hook 'ots-sql-mode-set-faces)
(add-hook 'sql-mode-hook 'ots-sql-mode-set-properties)
(add-hook 'sql-mode-hook 'sqlup-mode)

(provide 'ots-sql-mode)
;;; ots-sql-mode.el ends here
