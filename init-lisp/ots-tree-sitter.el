;;; -*- coding: utf-8 -*-
;;; ots-tree-sitter-mode.el

(require 'treesit-auto)
(setq treesit-auto-install t)
(setq treesit-auto-langs '(python))
(setq treesit-font-lock-level 3)
(global-treesit-auto-mode)

(provide 'ots-tree-sitter-mode)
;;; ots-tree-sitter-mode.el ends here
