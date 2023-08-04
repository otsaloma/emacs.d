;;; -*- coding: utf-8 -*-
;;; ots-treesit-mode.el

(require 'treesit-auto)
(setq treesit-auto-install t)
(setq treesit-auto-langs '(python))
(setq treesit-font-lock-level 3)
(global-treesit-auto-mode)

(provide 'ots-treesit-mode)
;;; ots-treesit-mode.el ends here
