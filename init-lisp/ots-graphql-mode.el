;;; -*- coding: utf-8 -*-
;;; ots-graphql-mode.el

(defun ots-graphql-mode-set-properties ()
  "Set properties for editing GraphQL files."
  (setq-local company-backends '((company-dabbrev)))
  (setq-local graphql-indent-level 2))

(add-hook 'graphql-mode-hook 'ots-graphql-mode-set-properties)
(modify-coding-system-alist 'file "\\.graphql\\'" 'utf-8)

(provide 'ots-graphql-mode)
;;; ots-graphql-mode.el ends here
