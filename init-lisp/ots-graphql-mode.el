;;; -*- coding: utf-8 -*-
;;; ots-graphql-mode.el

(defun ots-graphql-mode-set-properties ()
  "Set properties for editing GraphQL files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (setq-local company-backends '((company-dabbrev)))
  (setq graphql-indent-level 4)
  (setq fill-column 1000)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t))

(add-hook 'graphql-mode-hook 'ots-graphql-mode-set-properties)
(modify-coding-system-alist 'file "\\.graphql\\'" 'utf-8)

(provide 'ots-graphql-mode)
;;; ots-graphql-mode.el ends here
