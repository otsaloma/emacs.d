;;; -*- coding: utf-8 -*-
;;; ots-sql.el

(defun ots-sql-set-properties ()
  "Set properties for editing SQL files."
  ;; Allow double-quotes and backticks (for identifier names).
  (modify-syntax-entry ?\" "\"" sql-mode-syntax-table)
  (modify-syntax-entry ?\` "\"" sql-mode-syntax-table)
  (setq-local company-dabbrev-ignore-case t)
  (setq-local dash-docs-docsets '("PostgreSQL")))

(use-package company-dict)
(use-package sql
  :config
  (add-hook 'sql-mode-hook 'ots-sql-set-properties)
  (add-hook 'sql-mode-hook 'sqlup-mode))

(provide 'ots-sql)
;;; ots-sql.el ends here
