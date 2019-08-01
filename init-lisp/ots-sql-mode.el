;;; -*- coding: utf-8 -*-
;;; ots-sql-mode.el

(defun ots-sql-mode-set-faces ()
  "Set faces for editing SQL files."
  (sql-add-product-keywords
   'ansi '(("TINYINT" . font-lock-type-face))))

(defun ots-sql-mode-set-properties ()
  "Set properties for editing SQL files."
  (require 'company-dict)
  ;; Allow double-quotes and backticks (for identifier names).
  (modify-syntax-entry ?\" "\"" sql-mode-syntax-table)
  (modify-syntax-entry ?\` "\"" sql-mode-syntax-table)
  (setq-local company-dabbrev-ignore-case t)
  (setq-local helm-dash-docsets '("PostgreSQL")))

(add-hook 'sql-mode-hook 'ots-sql-mode-set-faces)
(add-hook 'sql-mode-hook 'ots-sql-mode-set-properties)
(add-hook 'sql-mode-hook 'sqlup-mode)

(provide 'ots-sql-mode)
;;; ots-sql-mode.el ends here
