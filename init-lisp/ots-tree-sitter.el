;;; -*- coding: utf-8 -*-
;;; ots-tree-sitter.el

(use-package treesit-auto
  :config
  (setq treesit-auto-install nil)
  (setq treesit-auto-langs '(python typescript))
  (setq treesit-font-lock-level 3)
  (global-treesit-auto-mode))

(provide 'ots-tree-sitter)
;;; ots-tree-sitter.el ends here
