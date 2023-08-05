;;; -*- coding: utf-8 -*-
;;; ots-tree-sitter.el

(require 'treesit-auto)
(setq treesit-auto-install t)
(setq treesit-auto-langs '(python))
(setq treesit-font-lock-level 3)
(global-treesit-auto-mode)

(provide 'ots-tree-sitter)
;;; ots-tree-sitter.el ends here
