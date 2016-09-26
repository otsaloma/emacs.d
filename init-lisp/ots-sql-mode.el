;;; -*- coding: utf-8 -*-
;;; ots-sql-mode.el

(defun ots-sql-mode-set-faces ()
  "Set faces for editing SQL files."
  (sql-add-product-keywords
   'ansi '(("TINYINT" . font-lock-type-face)
           ("\"\\([a-zA-Z0-9_]+\\)\"" 1 font-lock-string-face))))

(defun ots-sql-mode-set-properties ()
  "Set properties for editing SQL files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (setq-local company-backends '((company-dabbrev)))
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'sql-mode-hook 'ots-sql-mode-set-faces)
(add-hook 'sql-mode-hook 'ots-sql-mode-set-properties)

(provide 'ots-sql-mode)
;;; ots-sql-mode.el ends here
