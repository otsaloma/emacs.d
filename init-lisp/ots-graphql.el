;;; -*- coding: utf-8 -*-
;;; ots-graphql.el

(defun ots-graphql-set-properties ()
  "Set properties for editing GraphQL files."
  (setq-local graphql-indent-level 2))

(use-package graphql-mode
  :mode "\\.graphql\\'"
  :config
  (add-hook 'graphql-mode-hook 'ots-graphql-set-properties))

(provide 'ots-graphql)
;;; ots-graphql.el ends here
