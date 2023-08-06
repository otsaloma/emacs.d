;;; -*- coding: utf-8 -*-
;;; ots-graphql.el

(defun ots-graphql-set-properties ()
  "Set properties for editing GraphQL files."
  (setq-local graphql-indent-level 2))

(add-hook 'graphql-mode-hook 'ots-graphql-set-properties)
(modify-coding-system-alist 'file "\\.graphql\\'" 'utf-8)

(provide 'ots-graphql)
;;; ots-graphql.el ends here
